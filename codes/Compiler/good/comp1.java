/**
 * comparison between same record type:acc
 * Should be accepted
 * Author: Jingcheng Liu
 */

record A{
	int x,y,z;
}
int main(){
	int x,y,z;
	A a,b;
	printInt(a == b);
	return 0;
}
