/**
 * Condition for while should be int expr
 * Should be rejected
 **/
int main(){
    while('a')
	break;
    return 0;
}