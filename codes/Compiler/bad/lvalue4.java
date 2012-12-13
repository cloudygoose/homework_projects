/**
 * Test L-Value
 * Should be rejected
 * Author: Ziqing Xiang
 */

 record A {
	A a;
}

int main() {
	A a;
	(new A)=a;
}
