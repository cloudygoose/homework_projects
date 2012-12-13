/* The eight queens solver */

int printBoard(int[] col) {
  int i, j;
  
  for (i = 0; i < col.length; i = i+1) {
    for (j = 0; j < col.length; j = j+1) {
      if (col[i] == j) {
        printString(" O");
      } else {
        printString(" .");
      }
    }
    printChar('\n');
  }
  printChar('\n');
}

int main(string[ ] args) {
  int N;
  int[] row, col;
  int[][] d;
  
  N = 8;
 // printInt(N);
  //printInt(N);
  row = new int[N];
  col = new int[N];
  d = new int[][2];
  d[0] = new int[N+N-1];
  d[1] = new int[N+N-1];
  // fillIntArray is a contributed function
  fillIntArray(row, 0);
  fillIntArray(col, 0);
  fillIntArray(d[0], 0);
  fillIntArray(d[1], 0);

  search(N, row, col, d, 0);
}

int search(int N, int[] row, int[] col, int[][] d, int c) {
  int r;
//  printLine("in search and c = " + c + " and N = " + N);
  if (c == N) {
    printBoard(col);
  } else {
    for (r = 0; r < N; r = r+1) {
      if (row[r] == 0 && d[0][r+c] == 0 && d[1][r+N-1-c] == 0) {
        row[r] = d[0][r+c] = d[1][r+N-1-c] = 1;
        col[c] = r;
        search(N, row, col, d, c+1);
        row[r] = d[0][r+c] = d[1][r+N-1-c] = 0;
      }
    }
  }
}
