//Dai Bo
/* read a string from the terminal, print its reverse image,
 */

int main() {
	/* printString(reverse(readLine())); */
	/* printString(reverse("abcdefghijklmn\097\001\065\066\067\068\069\070")); */
	printString(reverse("abcdefghijklmn\topqrstuvwxyz"));
	printChar('\n');
}

string reverse(string s) {
	if (s.length <= 1) 
		return s;
	else
		return reverse(substring(s, 1, s.length - 1)) + substring(s, 0, 1);
}