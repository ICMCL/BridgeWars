import com.google.gson.JsonParser;
import io.netty.channel.embedded.EmbeddedChannel;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import net.minecraft.SharedConstants;
import net.minecraft.core.registries.Registries;
import net.minecraft.gametest.framework.GameTestHelper;
import net.minecraft.gametest.framework.GameTestMainUtil;
import net.minecraft.gametest.framework.TestFunctionLoader;
import net.minecraft.network.Connection;
import net.minecraft.network.protocol.PacketFlow;
import net.minecraft.network.protocol.game.ServerboundPlayerLoadedPacket;
import net.minecraft.network.protocol.game.ServerboundUseItemPacket;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.server.network.CommonListenerCookie;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.entity.vehicle.minecart.MinecartChest;
import net.minecraft.world.item.CrossbowItem;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.GameType;
import net.minecraft.world.phys.Vec3;
import net.minecraft.world.scores.ScoreHolder;

public class HeldUseTest {
    public static void main(String[] args) throws Exception {
        SharedConstants.tryDetectVersion();
        TestFunctionLoader.registerLoader(register -> register.accept(
            ResourceKey.create(Registries.TEST_FUNCTION, Identifier.parse("zq_test:player")), HeldUseTest::run));
        var src = Path.of(System.getProperty("mc.templateWorld"));
        // GameTest bakes only flat_all_dimensions; standalone datapack dimensions are ignored.
        var preset = "data/minecraft/worldgen/world_preset/flat_all_dimensions.json";
        try (var in = new InputStreamReader(HeldUseTest.class.getResourceAsStream("/" + preset), StandardCharsets.UTF_8)) {
            var json = JsonParser.parseReader(in).getAsJsonObject();
            json.getAsJsonObject("dimensions").add("zq:arena",
                JsonParser.parseString(Files.readString(src.resolveSibling("data").resolve("zq/dimension/arena.json"))));
            var out = Path.of("packs", "fixture").resolve(preset);
            Files.createDirectories(out.getParent());
            Files.writeString(out, json.toString());
        }
        GameTestMainUtil.runGameTestServer(args, universe -> {
            var dst = Path.of(universe, "gametestworld");
            try (var paths = Files.walk(src)) {
                for (var p : paths.toList()) {
                    var target = dst.resolve(src.relativize(p));
                    if (Files.isDirectory(p)) Files.createDirectories(target);
                    else Files.copy(p, target, StandardCopyOption.REPLACE_EXISTING);
                }
            } catch (IOException e) {
                throw new UncheckedIOException(e);
            }
        });
    }

    static void command(ServerPlayer p, String line) {
        var server = p.level().getServer();
        server.getCommands().performPrefixedCommand(server.createCommandSourceStack()
            .withLevel(p.level()).withEntity(p).withPosition(p.position()).withSuppressedOutput(), line);
    }

    static int score(ServerPlayer p, String holder, String objective) {
        var board = p.level().getScoreboard();
        return board.getPlayerScoreInfo(ScoreHolder.forNameOnly(holder), board.getObjective(objective)).value();
    }

    static void use(ServerPlayer p, InteractionHand hand, int sequence) {
        p.connection.handleUseItem(new ServerboundUseItemPacket(hand, sequence, p.getYRot(), p.getXRot()));
    }

    static void run(GameTestHelper h) {
        var p = (ServerPlayer) h.makeMockServerPlayer(GameType.ADVENTURE);
        var connection = new Connection(PacketFlow.SERVERBOUND);
        new EmbeddedChannel(connection);
        h.getLevel().getServer().getPlayerList().placeNewPlayer(
            connection, p, CommonListenerCookie.createInitial(p.getGameProfile(), false));
        p.connection.handleAcceptPlayerLoad(new ServerboundPlayerLoadedPacket());
        // EmbeddedChannel is not on the server connection listener's ticking list.
        h.onEachTick(p::doTick);
        h.startSequence().thenIdle(5).thenExecute(() -> {
            command(p, "function zq_test:rules");
            h.assertTrue(score(p, "#errors", "zq_var") == 0, "match_rules failed");
            command(p, "say ZQ_RULES_OK");
            command(p, "team join red @s");
            command(p, "scoreboard players set @s zq_cls 1");
            command(p, "scoreboard players set #o_bridge zq_var 2");
            command(p, "function zq:game/start");
            var cart = p.level().getEntitiesOfClass(MinecartChest.class, p.getBoundingBox().inflate(5)).getFirst();
            h.assertTrue(!p.getBoundingBox().intersects(cart.getBoundingBox()), "spawn overlaps the shop");
            cart.interact(p, InteractionHand.MAIN_HAND, Vec3.ZERO);
            h.assertTrue(p.containerMenu != p.inventoryMenu, "shop did not open");
            p.containerMenu.setCarried(cart.removeItem(2, 1)); // Ordinary click: icon on cursor, not in inventory.
            command(p, "function zq:shop/container_tick");
            h.assertTrue(p.containerMenu.getCarried().isEmpty() && score(p, "#red", "zq_coin") == 3
                && p.getInventory().countItem(Items.CARROT_ON_A_STICK) == 1, "cursor purchase failed");
            p.closeContainer();
            p.getInventory().add(cart.removeItem(3, 1)); // A carried icon away from the shop must be rejected.
            command(p, "execute in zq:arena run tp @s 0.5 101 0.5 -90 -15");
            p.connection.handleAcceptPlayerLoad(new ServerboundPlayerLoadedPacket());
            h.assertTrue(p.level().dimension().identifier().toString().equals("zq:arena"), "wrong test dimension: " + p.level().dimension());
            h.assertTrue(p.getOffhandItem().is(Items.SHIELD), "missing offhand kit shield");
            use(p, InteractionHand.OFF_HAND, 1);
            h.assertTrue(p.isUsingItem(), "offhand use packet was not accepted: " + p.gameMode() + " " + p.position());
        }).thenIdle(8).thenExecute(() -> {
            h.assertTrue(p.getInventory().countItem(Items.BARRIER) == 0 && score(p, "#red", "zq_coin") == 3,
                "out-of-range icon not collected or charged the team");
            h.assertTrue(p.isBlocking(), "one offhand press did not reach native shield blocking on the bridge: "
                + p.position() + " " + p.gameMode() + " ticks=" + p.getTicksUsingItem() + " hand=" + p.getOffhandItem());
        }).thenIdle(13).thenExecute(() -> {
            h.assertTrue(p.isBlocking() && p.getTicksUsingItem() >= 20, "shield use restarted");
            p.releaseUsingItem();
            command(p, "scoreboard players set @s zq_cls 2");
            command(p, "function zq:player/switch");
            for (int i = 0; i < 9; i++) {
                if (p.getInventory().getItem(i).is(Items.CROSSBOW)) p.getInventory().setSelectedSlot(i);
            }
            h.assertTrue(p.getMainHandItem().is(Items.CROSSBOW), "missing kit crossbow");
            command(p, "clear @s arrow 2");
            // Cross the 3-second arrow refill during the charge, not after it.
            command(p, "scoreboard players set #sec zq_var 2");
            command(p, "scoreboard players set #t zq_var 50");
            use(p, InteractionHand.MAIN_HAND, 2);
        }).thenIdle(24).thenExecute(() -> {
            p.releaseUsingItem();
            h.assertTrue(CrossbowItem.isCharged(p.getMainHandItem()), "one held press did not load the crossbow");
            h.assertTrue(p.getInventory().countItem(Items.ARROW) == 6, "expected 6 arrows + 1 refill - 1 loaded");
            use(p, InteractionHand.MAIN_HAND, 3);
            h.assertTrue(!CrossbowItem.isCharged(p.getMainHandItem()), "loaded crossbow did not fire");
            command(p, "say ZQ_PLAYER_OK");
        }).thenSucceed();
    }
}
