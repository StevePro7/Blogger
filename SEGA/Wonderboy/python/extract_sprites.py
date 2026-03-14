from PIL import Image
import math
from sms_rom_utils import *

def tile_density(tile):

    count = 0

    for row in tile:
        for p in row:
            if p != 0:
                count += 1

    return count


def find_sprite_tiles(tiles):

    result = []

    for i,t in enumerate(tiles):

        d = tile_density(t)

        if 10 < d < 40:
            result.append(i)

    return result


def build_sprite_sheet(tiles,indices,palette):

    frames = []

    for i in indices:

        if i+3 >= len(tiles):
            continue

        block = tiles[i:i+4]

        img = Image.new("P",(16,16))

        pal = []

        for v in palette:
            pal.extend(sms_to_rgb(v))

        pal += [0,0,0]*(256-16)

        img.putpalette(pal)

        for ty in range(2):
            for tx in range(2):

                tile = block[ty*2+tx]

                for y in range(8):
                    for x in range(8):

                        img.putpixel(
                            (tx*8+x,ty*8+y),
                            tile[y][x]
                        )

        frames.append(img)

    cols = 16
    rows = math.ceil(len(frames)/cols)

    sheet = Image.new("P",(cols*16,rows*16))

    for i,f in enumerate(frames):

        x = (i%cols)*16
        y = (i//cols)*16

        sheet.paste(f,(x,y))

    return sheet