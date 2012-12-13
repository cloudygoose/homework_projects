/**
 * Condition for while should be int expr
 * should be rejected
 **/
int main(){
    for(1,2,3,"a";1,'a';){
	break;
    }
    return 0;
}
