/*
p.s I ran this 1000+W...
by htx
*/

int check(int a, int N) {
	return ((a < N) && (a >= 0));
}

int addList(int x, int y, int N, int[][] step, int[] tail, int[] ok, int[] now, int[] xlist, int[] ylist, int targetx, int targety) {
    if (check(x, N) == 1 && check(y, N) == 1 && step[x][y] == -1) {
		tail[0] = tail[0] + 1;
		xlist[tail[0]] = x;
		ylist[tail[0]] = y;
		step[x][y] = now[0] + 1;
		if ((x == targetx) && (y == targety)) ok[0] = 1;
    }
}

int main() {
	int N;
	int head, startx, starty;
	int targetx, targety;
	int x, y;
	int[] xlist, ylist, tail, ok, now, dx, dy;
	int[][] step;
	int i, j;
	
	N = 100;
	tail = new int[1];
	ok = new int[1];
	now = new int[1];
	head = tail[0] = startx = starty = 0;
	targetx = targety  = N - 1;
	x = y = 0;
	now[0] = ok[0] = 0;
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
	dx = new int[8];
	dy = new int[9];
	dx[0] = -2; dy[0] = -1;
	dx[1] = -2; dy[1] = 1;
	dx[2] = 2; dy[2] = -1;
	dx[3] = 2; dy[3] = 1;
	dx[4] = -1; dy[4] = -2;
	dx[5] = -1; dy[5] = 2;
	dx[6] = 1; dy[6] = -2;
	dx[7] = 1; dy[7] = 2;
	while (head <= tail[0]) {
		x = xlist[head];
		y = ylist[head];
		now[0] = step[x][y];
		for (j = 0;j < 8;j = j + 1)
			addList(x + dx[j], y + dy[j], N, step, tail, ok, now, xlist, ylist, targetx, targety);
		if (ok[0] == 1) break;
		head = head + 1;
	}
	if (ok[0] == 1) printInt(step[targetx][targety]);
	else printString("no solution!");
}