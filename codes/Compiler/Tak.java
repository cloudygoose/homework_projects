﻿/*
	@author yixi
*/

int main(string[] args){
	printInt( tak(18, 12, 6) );
}

int tak(int x, int y, int z){
	if ( y < x ) return 1+tak( tak(x-1, y, z), tak(y-1, z, x), tak(z-1, x, y) );
	else return z;	
}

