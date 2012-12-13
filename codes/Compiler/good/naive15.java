/**
 * Test MuiltiArray
 * Should be accepted
 **/
record A{
    int status;
    int[] arr;
}

int main(){
    A[] aArray;
    int i;
    aArray = new A[15];
    for(i = 0; i < aArray.length; i = i+1)
	aArray[i].status = i, aArray[i].arr = new int[i+1], fillIntArray(aArray[i].arr, i);
    return 0;
}
