

//  writtenName(String name1, {name2}){
//   return "First name is $name1 and Second name is $name2";
//  }

// void main(){


// String name= writtenName("Roman",name2: "Hero" );

// print(name);

// }




myFunc(String name1,{name2 ="Hari"}){
  return "Hello $name1 and $name2";

}

void main(){


var name =  myFunc("John",name2: "Bill");
print(name);

}