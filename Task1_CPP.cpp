#include <iostream>
using namespace std;
//@author Daniele Llazo

int main()
{
	cout<<" Task 2 v 1.0,0 *C++ edition*\n ";
	cout<<"@author Daniele Llazo \n";
	
    int n; 
    int currentNUMBER,num; 
    int squareNUMBER; 
    int r; 
    int t; 
    int equal; 
  
    cout<<"Enter a number: ";
    cin>>n;
    cout<<"List of Automorphic numbers between 1 to "<<n<<" :\n";
    cout<<"Number : Square\n";
  
    for(int i = 1; i <= n; i++)
    {
        currentNUMBER = i; 
        num = i;
        squareNUMBER = currentNUMBER * currentNUMBER; 
        t = 10; 
        equal = 0;
   
        while(currentNUMBER > 0)
        {
            r = squareNUMBER % t;
            if(num == r)
            {
                equal = 1;
                break;
            }
            currentNUMBER = currentNUMBER / 10;
            t = t * 10;
        }
        if(equal == 1)
            cout<<num<<" : "<<squareNUMBER<<endl; 
    }
    return 0;
}
