void main(){
Person person1 = Person("Roman", "Male", 23);
person1.showData();

}
class Person{
  String?name,sex;
  int?age;

Person(String name,String sex,int age){
  this.name = name;
  this.sex = sex;
  this.age = age;

}

// Method
void showData(){
  print("Name is $name");
  print("Sex is $sex");
  print("Age is $age");

}




}