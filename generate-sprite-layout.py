#!/usr/bin/env python3

import os, sys
from PIL import Image

name = sys.argv[1]
h = int(sys.argv[2])
w = int(sys.argv[3])
xoff = int(sys.argv[4])
yoff = int(sys.argv[5])

image = Image.open("gfx/%s.png" % name)

for x in range(w):
	for y in range(h):
		print('')
		print('spriteset(spriteset_%s_%d_%d, "gfx/empty.png") { template_empty() }' % (name, x, y))
		print('alternative_sprites(spriteset_%s_%d_%d, ZOOM_LEVEL_IN_4X, BIT_DEPTH_32BPP, "gfx/%s.png") {[' % (name, x, y, name))
		imgx = image.width / 2 + x * 128 - y * 128 + xoff
		imgy = x * 64 + y * 64 + yoff
		print('	%d, %d, 128, 128, -64, 0 ]}' % (imgx, imgy))
		empty = True
		for ex in range(128):
			for ey in range(128):
				if image.getpixel((imgx + ex, imgy + ey))[3] != 0:
					empty = False
		if not empty:
			print('spritelayout spritelayout_%s_%d_%d { ground { sprite: LOAD_TEMP(1); } building { sprite: spriteset_%s_%d_%d; } }' % (name, x, y, name, x, y))
		else:
			print('spritelayout spritelayout_%s_%d_%d { ground { sprite: LOAD_TEMP(1); } building { sprite: LOAD_TEMP(2); zextent: 80; } }' % (name, x, y))

print('')
print('switch(FEAT_OBJECTS, SELF, switch_spritelayout_%s, relative_pos) {' % (name))
for x in range(w):
	for y in range(h):
		print('0x%02X%02X: spritelayout_%s_%d_%d;' % (x, y, name, x, y))
print('}')
