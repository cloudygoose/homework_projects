/**
 * Useed Non-declared fields
 * Should be rejected
 **/
record A{
    int size;
}

int main(){
    A a;
    a = new A;
    printInt(a.length);
}
