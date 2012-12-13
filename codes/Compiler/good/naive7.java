/**
 * Nested Record Declaration
 * Should be accepted
 **/
record A{
    int status;
    B next;
}

int main(){
    A a;
    B b;
    a = new A;
    b = new B;
    a.status = 0;
    b.status = 1;
    a.next = b;
    b.next = a;
    return 0;
}

record B{
    int status;
    A next;
}
