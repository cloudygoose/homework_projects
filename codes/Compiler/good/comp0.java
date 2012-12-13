/**
 * comparison between null and record:acc
 * Should be accepted
 * Author: Jingcheng Liu
 */

record A{
	int x,y,z;
}
int main(){
	int x,y,z;
	A a;
	printInt(a == null);
	return 0;
}
