/**
 * varDecl in Record shouldn't conflict with global names:acc
 * Aimed at post-order traversals without distinguishing record fields' declaration.
 * Should be accepted
 * Author: Jingcheng Liu
 */

record A{
	A x,y,z,A;
	int p;
}
int p(){
	return 0;
}
int main(){
	int x,y,z;
	printInt(p());
	return 0;
}
