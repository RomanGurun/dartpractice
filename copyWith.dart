
// Define Task class
class Task {
  final String ids;
  final String title;
  final String description;
  final String status;

  Task({
    required this.ids,
    required this.title,
    required this.description,
    required this.status
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
  }) {
    return Task(
      ids: id ?? this.ids,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}

void main() {
  // Create task
  Task task1 = Task(
    ids: '1',
    title: 'Original',
    description: 'Desc',
    status: 'P'
  );
  
  print('Original Task:');
  print('  Address: ${identityHashCode(task1)}');
  print('  Status: ${task1.status}');
  
  // Create modified copy
  Task task2 = task1.copyWith(status: 'C');
  
  print('\nModified Task:');
  print('  Address: ${identityHashCode(task2)}');
  print('  Status: ${task2.status}');
  
  print('\nComparison:');
  print('  Same object? ${identical(task1, task2)}');  // false
  print('  Same address? ${identityHashCode(task1) == identityHashCode(task2)}');  // false
  print('  Same status? ${task1.status == task2.status}');  // false
  print('  Same title? ${task1.title == task2.title}');  // true
  
  // Proving they're different objects:
  print('\ntask1 still has: ${task1.status}');  // P
  print('task2 now has: ${task2.status}');      // C
  
  print('\n========================================');
  print('CONCLUSION:');
  print('========================================');
  print('✅ Value modified: status changed from "P" to "C"');
  print('✅ Address changed: Different memory locations');
  print('✅ Original preserved: task1 still has status "P"');
  print('✅ New object created: task2 is a separate object');
}