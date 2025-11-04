
import 'dart:io';

void main(){
print("Enter a Number : ");
var num1 = stdin.readLineSync();

var val = int.parse(num1 ?? '0') + 10;
print("$num1 + 10 = $val");




}