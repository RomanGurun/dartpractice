void main(){
  var map ={
  "name":"john",
    "age":10,
    "gender":"male"
    
    
  };
  
  print(map);
  print(map["name"]);
  print(map.values);
  print(map.length);
  map["girlgriend"] = "Sophiya";
  print(map);
  
  
  map.addAll({"son":"rohan","daughter":"nabina"});
  print("Add ALl $map");

  map.remove("son");
  
  print("Deleted Son $map");

  map.clear();
  print(map);
  
  
  
  
  
}