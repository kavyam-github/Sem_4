import 'dart:io';

void main(){
  print("Enter the size of Series");
  int a=int.parse(stdin.readLineSync()!);
  print("1");
  print("2");
  Fibonacci(a);
}

void Fibonacci(int a){
  int b=1;
  int c=2;
  for(int i=2;i<a;i++){
    int z=b+c;
    print(z);
    b=c;
    c=z;
  }
}