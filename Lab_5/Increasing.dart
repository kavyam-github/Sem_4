import 'dart:io';

void main(){
  List<int> list=[];
  for(int i=0;i<5;i++){
    stdout.write("Enter number  at position ${i} : ");
    int n=int.parse(stdin.readLineSync()!);
    list.add(n);
  }
    print("Before Sorting");
    list.sort();
    print("After Sorting");
    print(list);

}