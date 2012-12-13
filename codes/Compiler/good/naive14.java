/**
 * Test All Native Function
 * Should be accepted
 **/
int main(){
    int bufferInt;
    char bufferChar;
    bufferInt = readInt();
    bufferChar = readChar();
    printInt(bufferInt);
    printChar(bufferChar);
    printString(bufferInt + bufferChar + " ");
    printLine(bufferInt + bufferChar + " ");
    printInt(ord('a'));
    printChar(chr(65));
    return 0;
}
