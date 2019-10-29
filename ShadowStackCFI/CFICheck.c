#include <stdio.h>

#include "enclave.h"

void CFICheck(long long target)
{
	long long *CFICheckAddressPtr = 0x1FFFFFFFFFFFFFFF;
	int CFICheckAddressNum = 0x1FFFFFFF;
	int low = 0, high = CFICheckAddressNum - 1, mid;

	puts("checking next indirect call...\n");

	char *target_str;
	target_str = my_itoa(target, target_str, 16);
	puts("target: ");
	puts(target_str);
	puts("\n");
	//Weijie: for debugging
	//char i_b[8];
	char *ii_b;

	while (low <= high)
	{
		mid = low + (high - low) / 2;
		//Weijie:
		puts("Matching CFICheckAddressPtr[mid]: ");
		ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 16);
		puts(ii_b);
		puts("\n");

		if (mid >= high)
		{
			break;
		}
		if (CFICheckAddressPtr[mid] == target)
		{
			puts("found it!\n");
			return;
		}
		else if (CFICheckAddressPtr[mid] > target)
		{
			//ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 10);
			puts("larger!\n");
			//puts("CFICheckAddress[mid]: ");
			//puts(ii_b);
			//puts("\n");
			high = mid - 1;
		}
		else
		{
			//ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 10);
			puts("smaller!\n");
			//puts("CFICheckAddress[mid]: ");
			//puts(ii_b);
			//puts("\n");
			low = mid + 1;
		}
	}
	//abort();
	exit(-1);
}
