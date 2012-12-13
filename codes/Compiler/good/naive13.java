/**
 * Test array and string
 * Should be accepted
 **/
int main(){
    int[] a;
    string b;
    a = new int[10];
    fillIntArray(a, 250);
    b = "lanlanlu";
    printChar(b[2]);
    printInt(a[2]);
    printInt(a.length);
    printInt(b.length);
    return 0;
}
