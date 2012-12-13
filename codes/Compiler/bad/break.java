/**
 * Break or Continue at wrong place.
 * Aimed at post-order traversals without counting method.
 * Should be rejected
 * Author: Jingcheng Liu
 */
int main(string[ ] args) {
	int x, i;
	x=0;
	if(x==0)if(x==0)if(x==0)break;
	for (i = 0; i < 100; i= i+1){
		x = x + i;
		if(i)continue;
	}
	if(x==0)if(x==0)if(x==0)continue;
	while(1){break;}
	printInt(x);
}


