import 'dart:io';

void main(){
  print("enter total number of subject: ");
  double f=double.parse(stdin.readLineSync()!);

  double sum = 0.0;

  for(int i=0;i<f;i++){
  print("enter marks of subject ${i+1}");
  double b=double.parse(stdin.readLineSync()!);
  sum += b;
  }
  double result=(sum/f);
  print("percentage of entered marks are: $result");

}