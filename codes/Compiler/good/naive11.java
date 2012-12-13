/**
 * Recursion Function
 * Should be accepted
 **/
int fab(int i){
    if ( i == 0 || i == 1)
	return 1;
    else return fab(i-1) + fab(i-2);
}

int main(){
    printInt(fab(5));
    return 0;
}
