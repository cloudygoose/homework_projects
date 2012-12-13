/**
 * Function call not function
 * Should be rejected
 * Author: Jingcheng Liu
 */

record A{
	A x,y,z;
}

A f() {
	int a;
	a=1;

}
int main(){
	A a;
	a();
	return 0;
}
