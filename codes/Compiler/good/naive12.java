/**
 * Nested Call, to compute A_{n} = B_{n-1}+1, B_{n} = 2*A_{n-1}, A_{0} = 1, B_{0} = 1
 * Should be accepted
 **/
int calcA(int n){
    if (n == 0)
	return 1;
    return calcB(n-1) + 1;
}

int main(){
    printInt(calcA(10));
    return 0;
}

int calcB(int n){
    if (n == 0)
	return 1;
     return 2*calcA(n-1);
}
