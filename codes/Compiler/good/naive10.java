/**
 * A Simple Case With Break and Continue
 * Should be accepted
 **/
int main(){
    int i, j;
    j = 0;
    for(i = 0; i < 10; i = i+1){
	if (i == 5)
	    continue;
	while(j < 10){
	    printString(i + " " + j);
	    j = j+1;
	    if (j == 9)
		break;
	} 
    }
    return 0;
}
