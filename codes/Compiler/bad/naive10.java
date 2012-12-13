/**
 * Duplicated Names between two levels
 * Should be rejected
 **/
int f(){
    int g;
    g = 100;
    return g;
}

int main(){
    printInt(f());
    return 0;
}

int g(){
    return 1;
}