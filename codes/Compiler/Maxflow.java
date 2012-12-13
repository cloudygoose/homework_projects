/* Author: Peng Shangfu */
/* Purpose: max flow and max match in bi-graph */

/*
change arr1 to int[]
change arr2 to int[][]
change the type of "i, j, open, closed" from "int" to "int[]"
add necessary parameters in build(), find() and improve()
by msh
*/

int main() {
	int[][] c;
	int[] ans;
	int[] visit, pre, f;
	int[] i, j, open, closed;
	int k, start, ending;
	int flag;
	int i1;
	
	c = new int[][110];
	for (i1 = 0; i1 < 110; i1 = i1 + 1) {
		c[i1] = new int[110];
		fillIntArray(c[i1], 0);
	}
	
	ans = new int[1];
	ans[0] = 0;
	visit = new int[110];
	fillIntArray(visit, 0);
	pre = new int[110];
	fillIntArray(pre, 0);
	f = new int[110];
	fillIntArray(f, 0);
	i = new int[1];
	i[0] = 0;
	j = new int[1];
	j[0] = 0;
	open = new int[1];
	
	open[0] = 0;
	closed = new int[1];
	closed[0] = 0;
	k = 0;
	start = 99;
	ending = 100;
	flag = 0;
	
	build(c, i, j, start, ending);
    while (find(open, closed, i, j, ending, visit, f, start, pre, flag, c)>0) {
	   improve(i, j, ans, pre, c, ending);
	}
    printInt(ans[0]);  	/*  ans[0] is 49  */
}

int build(int[][] c, int[] i, int[] j, int start, int ending) {
	for (i[0] = 1; i[0] <= 49; i[0] = i[0] + 1)
		for (j[0] = 50; j[0] <= 98-i[0]+1; j[0] = j[0] + 1) {
			c[i[0]][j[0]] = 1;
		}
	for (i[0] = 1; i[0] <= 49; i[0] = i[0] + 1)
		c[start][i[0]] = 1;
	for (i[0] = 50; i[0] <= 98; i[0] = i[0] + 1)
		c[i[0]][ending] = 1;
/*	

	for i=1 to 4 
	  for j=5 to 8-i+1 (
		c[i][j]=1
	  );
	
	for i=1 to 4  
		c[start][i]=1;
	for i=5 to 8  
	    c[i][ending]=1	
*/
}

int find(int[] open, int[] closed, int[] i, int[] j, int ending, int[] visit, int[] f, int start, int[] pre, int flag, int[][] c) {
	open[0] = 0; closed[0]=1;
	for (i[0] = 1; i[0] <= ending; i[0] = i[0] + 1) {
		visit[i[0]] = 0;
	}
	f[1]=start;
	visit[start]=1;
	pre[start]=0;
	flag=0;
	while (open[0]<closed[0] && flag==0) {
		open[0]=open[0]+1;
		i[0]=f[open[0]];
		for (j[0] = 1; j[0] <= ending; j[0] = j[0] + 1)
		if (c[i[0]][j[0]]>0 && visit[j[0]]==0) {
			visit[j[0]]=1;
			closed[0]=closed[0]+1;
			f[closed[0]]=j[0];
			pre[j[0]]=i[0];
			if (closed[0]==ending) flag=1;
		}
	}
	return flag;
}


int improve(int[] i, int[] j, int[] ans, int[] pre, int[][] c, int ending) {
	i[0]=ending;
	ans[0]=ans[0]+1;
	while (pre[i[0]]>0) {
		j[0]=pre[i[0]];
		c[j[0]][i[0]]=c[j[0]][i[0]] - 1;
		c[i[0]][j[0]]=c[i[0]][j[0]] + 1;
		i[0]=j[0];
	}
}
