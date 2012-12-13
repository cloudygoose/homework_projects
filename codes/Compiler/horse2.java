/*
origin: unknown
p.s I ran this 1721W...
by htx
*/

int check(int a, int N) {
	return ((a < N) && (a >= 0));
}

int main() {
	int N;
	int head, startx, starty;
	int targetx, targety, tail, ok, now;
	int x, y;
	int[] xlist, ylist;
	int[][] step;
	int i;
	
	N = 100;
	head = tail = startx = starty = 0;
	targetx = targety  = N - 1;
	x = y = 0;
	now = ok = 0;
	xlist = new int[N*N];
	fillIntArray(xlist, 0);
	ylist = new int[N*N];
	fillIntArray(ylist, 0);
	step = new int[][N];
	for (i = 0; i < N; i =  i + 1) {
		step[i] = new int[N];
		fillIntArray(step[i], -1);
	}
	xlist[0] = startx;
	ylist[0] = starty;
	step[startx][starty] = 0;
	while (head <= tail)
	{
		now = step[xlist[head]][ylist[head]];
	    x = xlist[head] - 1;
	    y = ylist[head] - 2;
	    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] - 1;
	    y = ylist[head] + 2;
	    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] + 1;
	    y = ylist[head] - 2;
	    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] + 1;
	    y = ylist[head] + 2;
	    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] - 2;
	    y = ylist[head] - 1;
	    if (check(x, N) == 1 && check(y, N)== 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] - 2;
	    y = ylist[head] + 1;
	    if (check(x, N) == 1 && check(y, N)== 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] + 2;
	    y = ylist[head] - 1;
	    if (check(x, N) == 1 && check(y, N)== 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    x = xlist[head] + 2;
	    y = ylist[head] + 1;
	    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1)
	    {
			tail = tail + 1;
			xlist[tail] = x;
			ylist[tail] = y;
			step[x][y] = now + 1;
			if (x == targetx && y == targety) ok = 1;
	    }
	    if (ok == 1) break;
	    head = head + 1;
	}
	if (ok == 1) printInt(step[targetx][targety]);
	else printString("no solution!");
}