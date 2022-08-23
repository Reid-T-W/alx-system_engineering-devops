#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
/**
 * main - main function that creates 5 zombie processes
 * Return: void
 */
void main(void)
{
	int process_no = 1;
	pid_t child = 1;

	while (process_no <= 5)
	{
		if (child != 0 && child != -1)
		{
			child = fork();
		}
		if (child == 0 && process_no == 5)
		{
			printf("Zombie process created, PID: %d\n", getpid());
		}
		process_no = process_no + 1;
	}
	if (child != 0 && child != -1)
	{
		infinite_while();
	}
}
