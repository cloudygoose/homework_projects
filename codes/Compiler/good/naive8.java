/**
 * A Simple For statement
 * Should be accepted
 **/
int main(){
    int i, j;
    for(i = 1, j = 2; i <= 10 && j <= 20; i = i+1, j = j+2)
	printInt(j/i);
    return 0;
}
