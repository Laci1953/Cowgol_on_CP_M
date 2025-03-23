//code by Rohit Jangid

int* t;
void (*fp)(void);

void init(int* tinit, void (*fpinit)(void))
{
	t = tinit;
	fp = fpinit;
}

int empty(int i)
{
	int j = 0;

	while((t[i]!=t[j])&&(abs(t[i]-t[j])!=(i-j))&&j<8)j++;

	return i == j ? 1 : 0;
}

void queens(int i)
{
	for (t[i] = 0 ; t[i] < 8; t[i]++)
		if (empty(i))
		{
			if (i == 7)
				fp();		
			else
				queens(i+1);
		}
}
