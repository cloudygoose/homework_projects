int main(string[] args) {
    int i;
    char c;
    string s;
    i = 97;
    c = chr(i); // c == 'a'
    s = "" + i; // s == "97"
    c = 'a';
    i = ord(c); // i == 97
    s = "" + c; // s == "a"
    s = "97";
    c = s[0];        // c == '9'
    c = s[1];        // c == '7'
    i = parseInt(s); // i == 97
    return 0;
}
