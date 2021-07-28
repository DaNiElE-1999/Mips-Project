#include<iostream>
using namespace std;
//@author Daniele Llazo
 
string Encrypt(string , int );
string Decrypt(string , int );

int main()
{
	cout<<" Task 2 v 1.0,0 *C++ edition*\n ";
	cout<<"@author Daniele Llazo \n";
	
	string message;
	int col; 
	int num;
	
	
	cout<<"Enter the message: ";
	cin>>message;
	
	cout<<"Enter the number of columns: ";
	cin>>col;
	
	cout<<"Enter 0 for Encryption or 1 for Decryption: ";
	cin>>num;
	
	if(num==0)
	{
		cout<<"The Encrypted string is: "<<Encrypt(message,col);
	}
	
	else if(num==1)
	{
		cout<<"The Decrypted string is: "<<Decrypt(message,col);
	}
	
	else 
	{
		cout<<"Wrong input!";
	}
	
	
}




string Encrypt(string message, int col)
{
	
	int i, j, l;
	int row=message.length()/col;
	
	if(message.length()%col)
	{
		row=row+1;
	}
	
	string tempSTRING;
	char square_View[row][col];
	
	
	
	for(i=0,l=0;i<row;i++) 
    { 
        for(j=0;j<col;l++,j++) 
        { 
        	
            square_View[j][i]=message[l];
            
            if(message[l] == '\0' ) 
            {
                square_View[j][i] = '_';      
            }
            
        } 
        
    }
    
    for(int i=0;i<row;i++) 
    { 
        for(int j=0;j<col;j++) 
        { 
			cout<<square_View[j][i]<<" ";
		}
		cout<<endl;
	}
    
    
	for(j=0;j<col;j++)
	{
		for(i=0;i<row;i++)
		{	
			tempSTRING=tempSTRING + square_View[j][i];
		}
		
	}
	
	return tempSTRING;
}



string Decrypt(string message, int col)
{
	
	int i, j, l;
	int row=message.length()/col;
	
	if(message.length()%col)
	{
		row=row+1;
	}
	
	string tempSTRING;
	char square_View[row][col];
	
	
	
	for(i=0,l=0;i<col;i++) 
    { 
        for(j=0;j<row;l++,j++) 
        { 
        	
            square_View[i][j]=message[l];
            
            if(message[l] == '\0' ) 
            {
                square_View[i][j] = '_';      
            }
            
        } 
        
    }
    
    for(int i=0;i<row;i++) 
    { 
        for(int j=0;j<col;j++) 
        { 
			cout<<square_View[j][i]<<" ";
		}
		cout<<endl;
	}
	
	for(j=0;j<row;j++)
	{
		for(i=0;i<col;i++)
		{	
			tempSTRING=tempSTRING + square_View[i][j];
		}
		
	}
	
	return tempSTRING;
	
}
