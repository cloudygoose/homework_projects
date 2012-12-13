/**
 * Wront number of parameters
 * Should be rejected
 **/
int f(int a, int b){
    return a+b;
}

int main(){
    printInt(f(1,2,3));
    return 0;
}