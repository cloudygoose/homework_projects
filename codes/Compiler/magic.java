int search(int x, int y, int z, int[] count, int[][] make, int[] color)
{
	int s;
	int i, j;
//	printLine(x + " " + y + " " + z);
    if ((y > 0 || y < 0) || x == 0 || make[x-1][0] + make[x-1][1] + make[x-1][2] == 15)
    {
        if (x == 2 && y == 2) {
            make[2][2] = 45 - z;
            s = make[0][0] + make[0][1] + make[0][2];
            if  (make[1][0] + make[1][1] + make[1][2] == s &&
                    make[2][0] + make[2][1] + make[2][2] == s &&
                    make[0][0] + make[1][0] + make[2][0] == s &&
                    make[0][1] + make[1][1] + make[2][1] == s &&
                    make[0][2] + make[1][2] + make[2][2] == s &&
                    make[0][0] + make[1][1] + make[2][2] == s &&
                    make[2][0] + make[1][1] + make[0][2] == s) 
            {
                count[0] = count[0] + 1;
                for (i = 0;i <= 2;i = i + 1) 
                {
                	for (j = 0;j <= 2;j = j + 1) 
                    {
                        printInt(make[i][j]);
                        printChar(' ');
                    }
                    printChar('\n');
                }
                printChar('\n');
            }
       }
       else {
            if (y == 2) {
                make[x][y] = 15 - make[x][0] - make[x][1];
                if (make[x][y] > 0 && make[x][y] < 10 && color[make[x][y]] == 0) {
                    color[make[x][y]] = 1;
                    if (y == 2)
                        search(x + 1, 0, z+make[x][y], count, make, color);
                    else
                        search(x, y+1, z+make[x][y], count, make, color);
                    color[make[x][y]] = 0;
            	}
            }
            else {
                for (i = 1;i <= 9;i = i + 1) {
                    if (color[i] == 0) {
                        color[i] = 1;
                        make[x][y] = i;
                        if (y == 2)
                            search(x + 1, 0, z+i, count, make, color);
                        else
                            search(x, y+1, z+i, count, make, color);
                        make[x][y] = 0;
                        color[i] = 0;
                    }
                }
            }
    	}
    }
}
int main()
{
	int[][] make;
	int[] color;
	int[] count;
	int i;
	count = new int[1];
	count[0] = 0;
	make = new int[][3];
	for (i = 0;i < 3;i = i + 1)
	{
		make[i] = new int[3];
		fillIntArray(make[i], 0);
	}
	color = new int[10];
	fillIntArray(color, 0);
    search(0, 0, 0, count, make, color);
    printInt(count[0]);
} 
