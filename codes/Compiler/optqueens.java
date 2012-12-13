/*
  The eight queens solver
  (for optimization, no output)
  @author Xiao Jia
*/

int main(string[ ] args) {
  int N;
  int[] row, col;
  int[][] d;
  int[] result;
  
  N = 8;
  row = new int[N];
  col = new int[N];
  d = new int[][2];
  d[0] = new int[N+N-1];
  d[1] = new int[N+N-1];
  result = new int[1];
  
  fillIntArray(row, 0);
  fillIntArray(col, 0);
  fillIntArray(d[0], 0);
  fillIntArray(d[1], 0);
  
  result[0] = 0;
  search(N, row, col, d, 0, result);
  printLine("Number of solutions: " + result[0]);
  
  return 0;
}

int search(int N, int[] row, int[] col, int[][] d, int c, int[] result) {
  int r;
  
  if (c == N) {
    result[0] = result[0] + 1;
  } else {
    for (r = 0; r < N; r = r+1) {
      if (row[r] == 0 && d[0][r+c] == 0 && d[1][r+N-1-c] == 0) {
        row[r] = d[0][r+c] = d[1][r+N-1-c] = 1;
        col[c] = r;
        search(N, row, col, d, c+1, result);
        row[r] = d[0][r+c] = d[1][r+N-1-c] = 0;
      }
    }
  }
}

