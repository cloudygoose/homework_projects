/**
 * A Simple Valid LinkedList Case
 * Should be Accepted
 **/
record A{
    int status;
    A next;
}

int main(){
    A list;
    list = new A;
    list.status = 0;
    list.next = null;
    return 0;
}
