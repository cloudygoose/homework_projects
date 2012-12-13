/**
 * varDecl in Record shouldn't conflict with local varialbes:acc
 * Aimed at post-order traversals without distinguishing record fields' declaration.
 * Should be accepted
 * Author: Jingcheng Liu
 */

record A{
	int x,y,z;
}
int main(){
	int x,y,z;
	return 0;
}
