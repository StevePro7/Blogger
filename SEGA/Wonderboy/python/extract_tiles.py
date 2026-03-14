from PIL import Image
import math
from sms_rom_utils import *

def extract_tiles(rom):

    tiles = []

    for i in range(0,len(rom),TILE_SIZE):

        tile_data = rom[i:i+TILE_SIZE]

        if len(tile_data) < TILE_SIZE:
            break

        tile = decode_tile(tile_data)

        tiles.append(tile)

    return tiles


def build_tilesheet(tiles, palette):

    cols = 32
    rows = math.ceil(len(tiles)/cols)

    img = Image.new("P",(cols*8,rows*8))

    pal = []

    for v in palette:
        pal.extend(sms_to_rgb(v))

    pal += [0,0,0]*(256-16)

    img.putpalette(pal)

    for i,tile in enumerate(tiles):

        tx = (i%cols)*8
        ty = (i//cols)*8

        for y in range(8):
            for x in range(8):

                img.putpixel((tx+x,ty+y),tile[y][x])

    return img


if __name__ == "__main__":

    rom = load_rom("WonderBoy.sms")

    palette = rom[998:998+16]   # example palette

    tiles = extract_tiles(rom)

    sheet = build_tilesheet(tiles,palette)

    sheet.save("tilesheet.png")