import 'dart:io';

void main(){
  print("enter marks of subject_1: ");
  double a=double.parse(stdin.readLineSync()!);
  print("enter marks of subject_2: ");
  double b=double.parse(stdin.readLineSync()!);
  print("enter marks of subject_3: ");
  double c=double.parse(stdin.readLineSync()!);
  print("enter marks of subject_4: ");
  double d=double.parse(stdin.readLineSync()!);
  print("enter marks of subject_5: ");
  double e=double.parse(stdin.readLineSync()!);
  double result=((a+b+c+d+e)/500)*100;
  print(result);
  if(result<35){
    print("Class: Fail");
  }
  else if(result>=35 && result<45){
    print("class: Pass");
  }
  else if(result>=45 && result<60){
    print("Class: Second");
  }
  else if(result>=60 && result<70){
    print("Class: First");
  }
  else{
    print("Distinction");
  }
}