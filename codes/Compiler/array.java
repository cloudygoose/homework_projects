/*
 * 	test 2D array
 *	should output a matrix
 */
int main(){
	int n, i, j;
	int[][] a;
	a = new int[][5];
	for (i = 0;i <= 4;i = i + 1)
	{
		a[i] = new int[5];
		for (j = 0;j <= 4;j = j + 1)
		{
			a[i][j] = i + j;
			printString(a[i][j] + " ");
		}
		printLine("");
	}
	return 0;
}
