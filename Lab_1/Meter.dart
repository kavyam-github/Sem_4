import 'dart:io';

void main(){
print("enter metere: ");
double a=double.parse(stdin.readLineSync()!);
double f=a*3.28084;
print("converted into feet: $f");
}