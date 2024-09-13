// Lookup table for scan codes
#include <devices/keyboard.h>
#include <stdio.h>
#include <stdbool.h>

static const char key_map[] = {
	' ',
	'\e', '1', '2', '3', '4', '5', '6',	'7', '8', '9', '0',	'-', '=', '\b',
	'\t', 'q', 'w', 'e', 'r', 't', 'y',	'u', 'i', 'o', 'p',	'[', ']', '\n',
	'\0', 'a', 's', 'd', 'f', 'g', 'h',	'j', 'k', 'l', ';',	'\'', '`', '\0',
	'\\', 'z', 'x', 'c', 'v', 'b', 'n',	'm', ',', '.', '/',	'\0', '*', '\0',
	' '
};

const char *pressed = "<key-pressed>:<%c>\n";
const char *released = "<key-released>:<%c>\n";

void keyboard_irq(uint8_t scan_code) {
	bool key_rel = scan_code & 0b10000000;
	uint8_t code = scan_code & 0b01111111;

	const char *str = (const char *)((1 - (uint32_t)key_rel)*(uint32_t)pressed + (uint32_t)key_rel*(uint32_t)released);

	if(code < sizeof(key_map)) {
		printf(str, key_map[code]);
	}
}


