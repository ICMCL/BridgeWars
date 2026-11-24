"""Procedural Anvil `.mca` builder for Bridge Wars (`战桥`).

Builds `minecraft:overworld` (y=150 glass lobby + y=137..141 flanking island protection
templates) and custom dimension `zq:arena` (y=97..101 CTF islands + stash chest) directly
into Minecraft 26.3 `.mca` chunks (`world/`).
"""
from __future__ import annotations

from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
for _cand in (ROOT.parent / "mcbeef" / "src", ROOT.parent / "mcbeef", ROOT.parent):
    if (_cand / "mcbeef" / "__init__.py").is_file() and str(_cand) not in sys.path:
        sys.path.insert(0, str(_cand))

from mcbeef.anvil import write_voxels_to_regions, write_world_save
from mcbeef.builder import VoxelBuilder
from mcbeef.nbt import Byte, read_gzip_nbt, write_gzip_nbt
from mcbeef.project import MapProjectConfig


def _add_ctf_islands(b: VoxelBuilder, y_surface: int) -> None:
    """Build the exact 17x9 Red (west) & Blue (east) CTF islands at `y_surface`."""
    # West Red Island (x = -46 .. -30, z = -4 .. 4)
    b.fill(-46, y_surface, -4, -30, y_surface, 4, "smooth_stone")
    b.walls_rect(-46, y_surface, -4, -30, y_surface, 4, "crimson_planks")
    b.fill(-45, y_surface - 1, -3, -31, y_surface - 1, 3, "stone")
    b.fill(-44, y_surface - 2, -2, -32, y_surface - 2, 2, "andesite")
    b.fill(-43, y_surface - 3, -1, -33, y_surface - 3, 1, "andesite")
    b.fill(-36, y_surface, -1, -34, y_surface, 1, "red_glazed_terracotta")
    b.setblock(-43, y_surface, 0, "gold_block")
    b.setblock(-43, y_surface + 1, 0, "red_banner")

    # East Blue Island (x = 29 .. 45, z = -4 .. 4)
    b.fill(29, y_surface, -4, 45, y_surface, 4, "smooth_stone")
    b.walls_rect(29, y_surface, -4, 45, y_surface, 4, "warped_planks")
    b.fill(30, y_surface - 1, -3, 44, y_surface - 1, 3, "stone")
    b.fill(31, y_surface - 2, -2, 43, y_surface - 2, 2, "andesite")
    b.fill(32, y_surface - 3, -1, 42, y_surface - 3, 1, "andesite")
    b.fill(33, y_surface, -1, 35, y_surface, 1, "blue_glazed_terracotta")
    b.setblock(42, y_surface, 0, "gold_block")
    b.setblock(42, y_surface + 1, 0, "blue_banner")


def build_overworld_voxels() -> VoxelBuilder:
    b = VoxelBuilder()
    # Lobby barrier shell (-6..5, 150..156, -6..6 hollow)
    b.fill(-6, 150, -6, 5, 156, 6, "barrier")
    b.fill(-5, 151, -5, 4, 155, 5, "air")

    # Lobby glass floor & team/spectator selection pads (y = 150)
    b.fill(-5, 150, -5, 4, 150, 5, "white_stained_glass")
    b.fill(-5, 150, -1, -4, 150, 1, "red_concrete")
    b.fill(3, 150, -1, 4, 150, 1, "blue_concrete")
    b.fill(-2, 150, 3, 1, 150, 5, "light_gray_concrete")

    # Start button & settings lectern
    b.setblock(-2, 151, -6, "emerald_block")
    b.setblock(-2, 151, -5, "stone_button[face=wall,facing=south]")
    b.setblock(1, 151, -5, "lectern[facing=south]")

    # Flanking 17x9 static island previews & cross-dimension protection templates (y = 137..140)
    _add_ctf_islands(b, y_surface=140)
    return b


def build_arena_voxels() -> VoxelBuilder:
    b = VoxelBuilder()
    b.setblock(0, 20, 0, "chest")
    _add_ctf_islands(b, y_surface=100)
    return b


def build_template_world(world_dir: Path | None = None, cfg: MapProjectConfig | None = None) -> Path:
    proj = cfg or MapProjectConfig.load(ROOT)
    target = world_dir or (ROOT / "world")

    ow = build_overworld_voxels()
    arena = build_arena_voxels()

    write_world_save(
        target,
        ow.voxels,
        level_name=proj.title,
        spawn_pos=proj.spawn_pos,
        spawn_yaw=proj.spawn_yaw,
        spawn_pitch=proj.spawn_pitch,
        biome=proj.biome,
        datapack_names=[proj.slug],
        noon_ticks=6000,
    )

    # Pre-build custom dimension `zq:arena` chunks directly
    write_voxels_to_regions(
        target / "dimensions" / "zq" / "arena" / "region",
        arena.voxels,
        biome="minecraft:the_void",
        pad_chunk_bounds=(-5, -3, 4, 2),
    )

    # Align `level.dat` (Easy difficulty) and `game_rules.dat` (natural regen, fall damage, TNT explodes) with Bridge Wars rules
    ldat_path = target / "level.dat"
    ldat = read_gzip_nbt(ldat_path)
    ldat["Data"]["Difficulty"] = Byte(1)
    write_gzip_nbt(ldat_path, ldat)

    gr_path = target / "data" / "minecraft" / "game_rules.dat"
    gr = read_gzip_nbt(gr_path)
    gr["data"]["minecraft:natural_health_regeneration"] = Byte(1)
    gr["data"]["minecraft:fall_damage"] = Byte(1)
    gr["data"]["minecraft:tnt_explodes"] = Byte(1)
    write_gzip_nbt(gr_path, gr)

    return target


if __name__ == "__main__":
    out = build_template_world()
    print(f"Generated 26.3 Anvil multi-dimension world at {out}")
