/**
 * Consistence of return value and function declaration
 * Should be rejected
 **/
int f(){
    return 1 + "";
}

int main(){
    printInt(f());
    return 0;
}