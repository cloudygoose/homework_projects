/**
 * comparisons between diferent record type
 * Should be rejected
 * Author: Jingcheng Liu
 */

record A{
	int x,y,z;
}
record B{
	int x,y,z;
}
int f(int k)
{
	if (k == 1) return 1;
	if (k == 2) return 1;
	return f(k - 1) + f(k - 2);
}
int main(){
	int i;
	int j;
	i = readInt();
	printInt(f(i));
	return 0;
}
