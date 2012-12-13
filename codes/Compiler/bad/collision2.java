/**
 * User defined functions cannot override native functions.
 *
 * This program should be rejected.
 **/

int printInt(int x) {
    return 0;
}

int main(string[] args) {
    printInt(100);
    return 0;
}
