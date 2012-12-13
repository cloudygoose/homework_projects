int qsort(int l, int r, int[] a)
{
	int i, j, x, k, temp;
	i = l;
	j = r;
	x = a[(l+r)/2];
	printLine("into sort");
	while (i < j)
	{
		while (a[i] < x) { i = i + 1; }
		while (a[j] > x) { j = j - 1; }
		if (i <= j)
		{
           	temp = a[i]; a[i] = a[j]; a[j] = temp;
            i = i + 1; j = j - 1;
		}
	}
	for (k = 1;k <= a.length - 1;k = k + 1)
		printString(a[k] + " ");
	printLine("");
	if (j > l) qsort(l, j, a);
	if (i < r) qsort(i, r, a);
	return 0;
}
int main(){
	int n, i, j;
	int[] a;
	printLine("please input n and n numbers");
	n = readInt();
	a = new int[n + 1];
	for (i = 1;i <= n;i = i + 1)
	{
		a[i] = readInt();
	}	
	printLine("sorting...");
	qsort(1, n, a);
	for (i = 1;i <= n;i = i + 1)
		printString(a[i] + " ");
	return 0;
}
