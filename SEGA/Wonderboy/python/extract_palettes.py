from sms_rom_utils import load_rom

def find_palettes(rom):

    palettes = []

    for i in range(len(rom)-16):

        block = rom[i:i+16]

        if all(b < 64 for b in block):

            palettes.append((i, list(block)))

    return palettes


if __name__ == "__main__":

    rom = load_rom("WonderBoy.sms")

    pals = find_palettes(rom)

    for i,p in enumerate(pals[:20]):
        print(i, hex(p[0]), p[1])