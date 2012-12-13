/**
 * Condition for IF should be int expr
 * Should be rejected
 **/
int main(){
    if ('a'){
	printString("eee");
    }
    return 0;
}