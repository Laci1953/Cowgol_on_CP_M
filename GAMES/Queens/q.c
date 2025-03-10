//code by Rohit Jangid

#include<stdio.h>
#include<stdlib.h>

int t[8];
int sol;

void init(void)
{
	sol = 1;
	t[0] = -1;
}

void printsol()
{
	int i,j;
	char crossboard[8][8];

	for(i=0;i<8;i++)
		for(j=0;j<8;j++)
			crossboard[i][j]='_';

	for(i=0;i<8;i++)
			crossboard[i][t[i]]='*';
	
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
			printf("%c ",crossboard[i][j]);
		printf("\n");
	}
}

int empty(int i)
{
	int j=0;
	while((t[i]!=t[j])&&(abs(t[i]-t[j])!=(i-j))&&j<8)j++;
	return i==j?1:0;
}

int* queens(int i)
{
	for(t[i]=0;t[i]<8;t[i]++)
	{
		if(empty(i))
		{
			if(i==7)
			{
				printf("\n Solution %d\n\n",sol++);
				printsol();
			}
			else
				queens(i+1);
		}
	}
}
