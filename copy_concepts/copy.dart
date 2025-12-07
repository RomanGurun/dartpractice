// Define Task class OUTSIDE main
class Task {
  String id;
  String title;
  Task({required this.id, required this.title});
}

void main() {
  print('========================================');
  print('SHALLOW COPY DEMO (List.from)');
  print('========================================\n');
  
  // Step 1: Create original list
  List<Task> tasks = [
    Task(id: '1', title: 'Original'),
  ];
  print('Step 1: Created original list');
  print('  tasks[0].title = "${tasks[0].title}"');
  print('');
  
  // Step 2: Create shallow copy
  List<Task> copy = List.from(tasks);
  print('Step 2: Created shallow copy with List.from()');
  print('  tasks[0].title = "${tasks[0].title}"');
  print('  copy[0].title = "${copy[0].title}"');
  print('  Are they the SAME object? ${identical(tasks[0], copy[0])}');
  print('');
  
  // Step 3: Modify through copy
  copy[0].title = 'Roman';
  print('Step 3: Changed copy[0].title to "Modified"');
  print('  tasks[0].title = "${tasks[0].title}" ⚠️ ALSO CHANGED!');
  print('  copy[0].title = "${copy[0].title}"');
  print('  Why? Because they point to the SAME object!');
  print('');
  
  // Step 4: Clear copy list
  copy.clear();
  print('Step 4: Cleared copy list');
  print('  tasks.length = ${tasks.length} ✅');
  print('  copy.length = ${copy.length} ✅');
  print('  tasks[0].title = "${tasks[0].title}" ⚠️ Still "Modified"!');
  print('');
  
  print('========================================');
  print('DEEP COPY DEMO (Manual Copy)');
  print('========================================\n');
  
  // Step 5: Create new original list
  List<Task> tasks2 = [
    Task(id: '2', title: 'Original2'),
  ];
  print('Step 5: Created new original list');
  print('  tasks2[0].title = "${tasks2[0].title}"');
  print('');
  
  // Step 6: Create deep copy
  List<Task> deepCopy = tasks2.map((task) => 
    Task(id: task.id, title: task.title)
  ).toList();
  print('Step 6: Created deep copy with .map()');
  print('  tasks2[0].title = "${tasks2[0].title}"');
  print('  deepCopy[0].title = "${deepCopy[0].title}"');
  print('  Are they the SAME object? ${identical(tasks2[0], deepCopy[0])}');
  print('');
  
  // Step 7: Modify deep copy
  deepCopy[0].title = 'DeepModified';
  print('Step 7: Changed deepCopy[0].title to "DeepModified"');
  print('  tasks2[0].title = "${tasks2[0].title}" ✅ NOT CHANGED!');
  print('  deepCopy[0].title = "${deepCopy[0].title}"');
  print('  Why? Because they are DIFFERENT objects!');
  print('');
  
  // Step 8: Clear deep copy
  deepCopy.clear();
  print('Step 8: Cleared deepCopy list');
  print('  tasks2.length = ${tasks2.length} ✅');
  print('  deepCopy.length = ${deepCopy.length} ✅');
  print('  tasks2[0].title = "${tasks2[0].title}" ✅ Still "Original2"!');
  print('');
  
  print('========================================');
  print('CONCLUSION:');
  print('========================================');
  print('Shallow Copy (List.from):');
  print('  ❌ Modifying copy affects original');
  print('  ✅ Fast and memory efficient');
  print('  ✅ List structure is independent');
  print('');
  print('Deep Copy (.map):');
  print('  ✅ Modifying copy does NOT affect original');
  print('  ❌ Slower and uses more memory');
  print('  ✅ Complete independence');
}