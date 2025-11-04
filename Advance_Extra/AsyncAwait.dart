
Future<String> here()async{
  
  await Future.delayed(Duration(seconds:3));
  print("This is a DEMO OF A HERE ASYNC Class");

  throw HereClass("This is a here exception");

}

class HereClass implements Exception{
 // ignore: prefer_typing_uninitialized_variables
 final message;
  HereClass(this.message);
  
  
  @override
  String toString()=>"Exception is $message";
  
  
  
  
}


Future<String> some()async{
  await Future.delayed(const Duration(seconds : 1));
  print("This is a DEMO OF A SOME ASYNC Class");
  
  throw SomeException("Somehting went wrongs here By System");

  
}


class SomeException implements Exception{
  final String message;
  
  SomeException(this.message);
  
  @override
  String toString() => "Exception is $message";
  
 
}
void main()async{
 try{
   await here();
 }catch(err){
   print(err);
 }
  
  try{
    await some();
  }catch(err){
    print(err);
    
  }
  
  
}
