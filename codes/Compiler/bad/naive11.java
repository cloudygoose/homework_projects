/**
 * Plus between two records
 * Should be rejected
 **/
record A{
    int a;
}

int main(){
    A a, b, c;
    a = new A;
    b = new A;
    c = a + b;
    return 0;
}
