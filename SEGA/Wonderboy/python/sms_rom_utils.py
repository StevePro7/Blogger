import struct

TILE_SIZE = 32

def load_rom(path):
    with open(path, "rb") as f:
        return f.read()

def sms_to_rgb(v):
    r = (v & 0x03) * 85
    g = ((v >> 2) & 0x03) * 85
    b = ((v >> 4) & 0x03) * 85
    return (r,g,b)

def decode_tile(data):
    pixels = []

    for row in range(8):
        b0 = data[row*4+0]
        b1 = data[row*4+1]
        b2 = data[row*4+2]
        b3 = data[row*4+3]

        row_pixels = []

        for bit in range(7,-1,-1):
            p = (
                ((b0>>bit)&1) |
                (((b1>>bit)&1)<<1) |
                (((b2>>bit)&1)<<2) |
                (((b3>>bit)&1)<<3)
            )

            row_pixels.append(p)

        pixels.append(row_pixels)

    return pixels