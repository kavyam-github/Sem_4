import 'dart:io';

void main(){
  print("enter number: ");
  int n=int.parse(stdin.readLineSync()!);
  if(n>=0){
    print("entered number is positive");
  }
  else{
    print("entered number is negative");
  }
}