import 'dart:io';

void main(){
  print("enter num 1: ");
  int a=int.parse(stdin.readLineSync()!);
  print("enter num 2: ");
  int b=int.parse(stdin.readLineSync()!);
  print("add: ${a+b}");
}


