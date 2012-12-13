/**
 * Test break and continue;
 * Aimed at post-order traversals without counting method.(Should be used together with the bad ones).
 * Should be accepted
 * Author: Jingcheng Liu
 */
int main(string[ ] args) {
	int x, i;
	x=0;
	if(x==0)if(x==0)if(x==0)x=0;
	for (i = 0; i < 100; i= i+1){
		x = x + i;
		if(i)continue;
	}
	if(x==0)if(x==0)if(x==0)x=-1;
	while(1){break;}
	printInt(x);
}
