/**
 * comma expressions in FunctionCall and mixed-up INT:acc
 * Should be accepted
 * Author: Jingcheng Liu
 */
int main(){
	int x,y,z,a,b;
	char c;
	a=3||4&&5+!!67;
	printInt(((a=7),8,'a',9));
	return 0;
}
