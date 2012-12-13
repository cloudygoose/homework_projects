/**
 * comparisons between diferent record type
 * Should be rejected
 * Author: Jingcheng Liu
 */

record A{
	A x,y,z;
}
record B{
	B x,y,z;
}

int main(){
	A a;
	B b;
	printInt(a==b);
	return 0;
}
