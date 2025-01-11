import 'dart:collection';
import 'dart:io';

void main(){
  List<int> list_1=[];
  List<int> list_2=[];
  print("Enter number of elements first loop : ");
  int a=int.parse(stdin.readLineSync()!);
  for(int i=0;i<a;i++) {
    stdout.write("Enter number  at position ${i} : ");
    int n1 = int.parse(stdin.readLineSync()!);
    list_1.add(n1);
  }
  print("Enter number of elements second loop: ");
  int b=int.parse(stdin.readLineSync()!);
  for(int i=0;i<b;i++) {
    stdout.write("Enter number  at position ${i} : ");
    int n2 = int.parse(stdin.readLineSync()!);
    list_2.add(n2);
  }
  List<int> Common=[];
  for(int i=0;i<list_1.length;i++){
    for(int j=0;j<list_2.length;j++){
      if(list_1[i]==list_2[j]){
        Common.add(list_1[i]);
      }
    }
  }
  HashSet<int> number= HashSet();
  for(int j in Common){
    number.add(j);
  }
  print(number);

}


