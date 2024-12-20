import 'dart:io';

void main(){
  print("Enter First number : ");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter Second numner : ");
  int b=int.parse(stdin.readLineSync()!);
  num(a, b);
}
  void num(int a,b){
    if(a>b){
      print("A is largest number : ${a}");
    }
    else{
      print("B is largest number : ${b}");

    }
  }