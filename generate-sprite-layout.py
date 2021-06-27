#!/usr/bin/env python3

import os, sys

name = sys.argv[1]

for x in range(15):
	for y in range(15):
		print('')
		print('spriteset(spriteset_%s_%d_%d, "gfx/empty.png") { template_empty() }' % (name, x, y))
		print('alternative_sprites(spriteset_%s_%d_%d, ZOOM_LEVEL_IN_4X, BIT_DEPTH_32BPP, "gfx/%s.png") {[' % (name, x, y, name))
		print('	%d, %d, 128, 128, -64, -64 ]}' % (x * 128 + y * 64, y * 128 + x * 64))
		print('spritelayout spritelayout_%s_%d_%d { ground { sprite: GROUNDSPRITE_NORMAL; } building { sprite: spriteset_%s_%d_%d; } }' % (name, x, y, name, x, y))

print('')
print('switch(FEAT_OBJECTS, SELF, switch_spritelayout_%s, relative_pos) {' % (name))
for x in range(15):
	for y in range(15):
		print('0x%02X%02X: spritelayout_%s_%d_%d;' % (x, y, name, x, y))
print('}')
