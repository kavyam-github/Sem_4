import 'dart:io';

void main(){
  print("Enter principal amount :  ");
  double P=double.parse(stdin.readLineSync()!);
  print("Enter Rate of interest : ");
  double R=double.parse(stdin.readLineSync()!);
  print("Enter total time period : ");
  double T=double.parse(stdin.readLineSync()!);
  print("Simple interest : ${SI(P, R, T)}");
}

double SI(double P, double R,double T){
  double ans=(P*R*T)/100;
  return ans;
}