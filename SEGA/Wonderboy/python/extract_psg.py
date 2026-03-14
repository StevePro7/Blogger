from sms_rom_utils import load_rom

def find_psg_sequences(rom):

    sequences = []

    for i in range(len(rom)-32):

        block = rom[i:i+32]

        score = 0

        for b in block:

            if (b & 0x80):
                score += 1

        if score > 20:
            sequences.append(i)

    return sequences


if __name__ == "__main__":

    rom = load_rom("WonderBoy.sms")

    seq = find_psg_sequences(rom)

    for s in seq[:20]:
        print(hex(s))