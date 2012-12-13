/**
 * Array and with wrong field
 * Should be rejected
 **/
int main(){
    int[] a;
    a = new int[10];
    printInt(a.length);
    printInt(a.eee);
    return 0;
}
