from sms_rom_utils import *
from extract_tiles import *
from extract_sprites import *

def build_project(rom_path):

    rom = load_rom(rom_path)

    palette = rom[998:998+16]

    tiles = extract_tiles(rom)

    tilesheet = build_tilesheet(tiles,palette)

    tilesheet.save("assets/tiles.png")

    sprite_indices = find_sprite_tiles(tiles)

    sprite_sheet = build_sprite_sheet(
        tiles,
        sprite_indices,
        palette
    )

    sprite_sheet.save("assets/sprites.png")

    print("Assets generated")


if __name__ == "__main__":

    build_project("WonderBoy.sms")