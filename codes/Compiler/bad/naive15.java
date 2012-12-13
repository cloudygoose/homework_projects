/**
 * Uncompatible type of a call with a declaration 
 * Should be rejected
 **/
int f(int a, char b){
    return a+b;
}

int main(){
    printInt(f(2, "b"));
    return 0;
}