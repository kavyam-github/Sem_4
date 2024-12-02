import 'dart:io';

void main(){
  print("enter weight in Pound: ");
  double a=double.parse(stdin.readLineSync()!);
  double kg=a*0.45359237;
  print("entered height in inches: ");
  double b=double.parse(stdin.readLineSync()!);
  double f=b*0.0254;
  double BMI=kg/(f*f);
  print("Your BMI : $BMI");
}