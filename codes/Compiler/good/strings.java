int main(string[] args) {
    string a, b;
    string s;
    string x, y;
    a = "hello";
    b = a;
    s = "hello";
    s[0] == 'h';
    s[1] == 'e';
    s = "hello";
    s.length == 5;
    "hello".length == 5;
    x = "a";
    y = "ab";
    x == "a" && y == "ab";
    x < y && y < "b";
    s = "hello";
    substring(s, 0, s.length) == "hello";
    substring(s, 1, 2) == "el";
    s = "hello";
    s = s + ", " + 2012;
    s == "hello, 2012";
    return 0;
}