#define REG (*(volatile unsigned int*)0x43c00000)

int main(void) {
	REG = 0x123456;
	REG = 0x120400;
	REG = 0x410410;

	return 0;
}
