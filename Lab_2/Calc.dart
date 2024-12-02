import 'dart:io';
void main(){
  print("Enter first number: ");
  double a=double.parse(stdin.readLineSync()!);
  print("Enter second number: ");
  double b=double.parse(stdin.readLineSync()!);
  print("Enter choice:\n"
      "1.Addition\n"
      "2.Subtraction\n"
      "3.Multiplication\n"
      "4.Division\n"
      "5.Modulo\n");

  int choice=int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      print("Addition of entered number: ${a+b}");
      break;
    case 2:
      print("Subtraction of entered number: ${a-b}");
      break;
    case 3:
      print("Multiplication of entered number: ${a*b}");
      break;
    case 4:
      print("Division of entered number: ${a/b}");
      break;
    case 5:
      print("Modulo of entered number: ${a%b}");
  }
}
