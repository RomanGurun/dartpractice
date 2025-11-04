void main(){
  
  var list = [1,2,3,4];
  print(list[0]);
  
  list.add(40);
  print(list);
  
  list.addAll([2,3,4,5]);
  print(list);
  
  list.insert(1,90000);
  print(list);
  
  list.removeAt(1);
  print(list);
  
}