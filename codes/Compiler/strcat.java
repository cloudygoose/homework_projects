int main(){
	int n;
	int j;
	string[] s;
	printLine("Please input two strings");
	s = new string[2];
	printLine("After new string");
	s[0] = readString();
	s[1] = readString();
	printLine(s[0] + s[1]);
	return 0;
}
