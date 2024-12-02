import 'dart:io';

void main(){
  print("enter first number: ");
  int a=int.parse(stdin.readLineSync()!);
  print("enter second number: ");
  int b=int.parse(stdin.readLineSync()!);
  print("enter third number: ");
  int c=int.parse(stdin.readLineSync()!);
  if(a>=b){
    if(a>=c) {
      print("largest number: ${a}");
    }
      else{
        print("largest number: ${c}");
    }
    }
    else{
      if(b>=c){
        print("largest number: ${b}");
      }
      else{
        print("largest number: ${c}");
      }
    }
}