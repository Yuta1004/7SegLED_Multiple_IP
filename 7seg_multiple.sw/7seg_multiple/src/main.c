#include "xil_printf.h"

#define REG (*(volatile unsigned int*)0x43c00000)

int main(void) {
	REG = 0x123456;
	xil_printf("%x\n", REG);

	REG = 0x120400;
	xil_printf("%x\n", REG);

	REG = 0x410410;
	xil_printf("%x\n", REG);

	return 0;
}
