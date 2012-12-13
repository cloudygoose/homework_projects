/**
 * A Function Call
 * Should be accepted
 **/
string echo(string name){
    return "I'm " + name;
}

int main(){
    printString(echo("lanlanlu"));
    return 0;
}
