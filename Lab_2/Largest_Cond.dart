import 'dart:io';
void main(){
  print("enter first number: ");
  int a=int.parse(stdin.readLineSync()!);
  print("enter second number: ");
  int b=int.parse(stdin.readLineSync()!);
  print("enter third number: ");
  int c=int.parse(stdin.readLineSync()!);
  if(a>b && a>c){
    print("a is largest : ${a}");
  }
  else if(b>a && b>c){
    print("b is largest : ${b}");
  }
  else
    print("c is largest: ${c}");
}