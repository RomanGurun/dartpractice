
import 'dart:math';

Future<String> here()async{
   print("I am here");
  await Future.delayed(Duration(seconds: 3));
  // print("I am here");
  throw SomeHere("This is a exception by Roman");


}
class SomeHere implements Exception{
  late final message;

  SomeHere(this.message);


@override
String toString()=> "Exception is $message";


}


Future<String> there()async{
  print("I am there");
  await Future.delayed(Duration(seconds: 3));
//  print("I am there");
 
throw thereClass("Exception on thereClass by Roman");



}
class thereClass implements Exception{
final message;
     thereClass(this.message);
     @override
  String toString()=> "Excecption is $message";

}



void main()async{
  try{
    await here();
  }catch(err){
    print(err);
    
  }

try{
  await there();
}catch(err){
  print(err);

}



}







