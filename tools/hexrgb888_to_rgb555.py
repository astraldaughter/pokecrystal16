# Very simple python script that lets the user input a hex code and convert it
# into the format used by pokecrystal's .pal files.

import math

colour = input("Input hexadecimal colour code: ")
rgb_colour = [colour[i:i+2].upper() for i in range(0, len(colour), 2)]
print(rgb_colour)
for i in range(0, len(rgb_colour)):
    rgb_colour[i] = str(math.floor(int(rgb_colour[i], 16) / 8))
print("RGB " + rgb_colour[0] + ", " + rgb_colour[1] + ", " + rgb_colour[2])
