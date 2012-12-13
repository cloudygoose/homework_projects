/**
 * Function appear on the left of ==
 * Should be accepted
 * Author: Jingcheng Liu
 */

record A{
	A x,y,z;
}
A f(){
	return new A;
}
int main(){
	printInt(f().x==new A);
	return 0;
}
