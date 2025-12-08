// ============================================================================
// WHY GETTERS HAVE NO () PARENTHESES - Complete Explanation
// ============================================================================

class Task {
  final String id;
  final String status;
  Task({required this.id, required this.status});
}

class Example {
  List<Task> tasks = [];
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // REGULAR METHOD - Requires ()
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  
  List<Task> getPendingTasks() {  // ← Notice the () here
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  void useMethod() {
    // MUST use () when calling
    var result = getPendingTasks();  // ✅ With ()
    //                          ↑↑
    //                   Required parentheses!
    
    // var result = getPendingTasks;  // ❌ ERROR! Won't work
  }
  
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // GETTER - NO () needed or allowed
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  
  List<Task> get pendingTasks {  // ← NO () here!
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  void useGetter() {
    // NO () when accessing
    var result = pendingTasks;   // ✅ Without ()
    //                       
    //              No parentheses!
    
    // var result = pendingTasks();  // ❌ ERROR! Won't work
    //                          ↑↑
    //                   This causes an error!
  }
}


// ============================================================================
// THE RULE: Getters NEVER have () - Neither in definition nor in usage
// ============================================================================

class TheRule {
  List<Task> tasks = [];
  
  // ┌────────────────────────────────────────────────────────────────┐
  // │  DEFINING A GETTER - NO () in the definition                   │
  // └────────────────────────────────────────────────────────────────┘
  
  // ✅ CORRECT - Getter definition (no parentheses)
  List<Task> get pendingTasks {
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  // ❌ WRONG - This would be a regular method
  // List<Task> get pendingTasks() {  // ← () here makes it a method, not getter!
  //   return tasks.where((task) => task.status == 'P').toList();
  // }
  
  
  // ┌────────────────────────────────────────────────────────────────┐
  // │  USING A GETTER - NO () when accessing                        │
  // └────────────────────────────────────────────────────────────────┘
  
  void examples() {
    // ✅ CORRECT - Access getter (no parentheses)
    var result1 = pendingTasks;
    print(pendingTasks.length);
    if (pendingTasks.isEmpty) { }
    
    // ❌ WRONG - Adding () causes an error
    // var result2 = pendingTasks();  // ERROR!
    // print(pendingTasks().length);  // ERROR!
  }
}


// ============================================================================
// WHY NO PARENTHESES? - The Design Philosophy
// ============================================================================

/*
❓ Why did Dart designers make getters work without ()?

✅ ANSWER: To make them look like PROPERTIES, not functions

The goal: Make computed values look the same as stored values

┌─────────────────────────────────────────────────────────────────┐
│  PRINCIPLE: "If it acts like a property, it should look like    │
│             a property"                                         │
└─────────────────────────────────────────────────────────────────┘
*/

class DesignPhilosophy {
  // Stored property (variable)
  String name = "John";
  int age = 25;
  
  // Computed property (getter)
  String get displayName => "User: $name";
  int get ageInMonths => age * 12;
  
  void usage() {
    // Notice: Both stored and computed properties use the SAME syntax
    
    print(name);         // Stored property  - no ()
    print(displayName);  // Computed property - no ()
    //    ↑                   ↑
    //    Look identical!
    
    print(age);          // Stored property  - no ()
    print(ageInMonths);  // Computed property - no ()
    //    ↑                   ↑
    //    Look identical!
  }
}


// ============================================================================
// COMPARISON: With () vs Without ()
// ============================================================================

class Comparison {
  List<Task> tasks = [];
  
  // ───────────────────────────────────────────────────────────────────────
  // METHOD (requires parentheses)
  // ───────────────────────────────────────────────────────────────────────
  
  List<Task> getPendingTasks() {
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  List<Task> getCompletedTasks() {
    return tasks.where((task) => task.status == 'C').toList();
  }
  
  void methodUsage() {
    // Must remember to add () everywhere
    var pending = getPendingTasks();      // ()
    var completed = getCompletedTasks();  // ()
    
    if (getPendingTasks().isEmpty) { }    // ()
    for (var task in getPendingTasks()) { } // ()
    print(getPendingTasks().length);      // ()
    //    ↑ Gets tedious to write () everywhere
  }
  
  
  // ───────────────────────────────────────────────────────────────────────
  // GETTER (no parentheses)
  // ───────────────────────────────────────────────────────────────────────
  
  List<Task> get pendingTasks {
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  List<Task> get completedTasks {
    return tasks.where((task) => task.status == 'C').toList();
  }
  
  void getterUsage() {
    // Clean, simple syntax - no ()
    var pending = pendingTasks;       // No ()
    var completed = completedTasks;   // No ()
    
    if (pendingTasks.isEmpty) { }     // No ()
    for (var task in pendingTasks) { } // No ()
    print(pendingTasks.length);       // No ()
    //    ↑ Cleaner and more readable!
  }
}


// ============================================================================
// THE SYNTAX BREAKDOWN
// ============================================================================

class SyntaxBreakdown {
  List<Task> tasks = [];
  
  // ┌──────────────────────────────────────────────────────────────┐
  // │  METHOD SYNTAX                                               │
  // └──────────────────────────────────────────────────────────────┘
  
  //  Return Type    Name       Parameters  Body
  //      ↓           ↓             ↓         ↓
  List<Task> getPendingTasks(        ) { return ...; }
  //                         ↑↑
  //                    Empty () required
  //                    (even if no parameters)
  
  
  // ┌──────────────────────────────────────────────────────────────┐
  // │  GETTER SYNTAX                                               │
  // └──────────────────────────────────────────────────────────────┘
  
  //  Return Type  get  Name          Body
  //      ↓         ↓    ↓              ↓
  List<Task> get pendingTasks { return ...; }
  //                     
  //              NO () anywhere!
  //              The "get" keyword replaces ()
  
  
  // ┌──────────────────────────────────────────────────────────────┐
  // │  ARROW SYNTAX (shorthand)                                    │
  // └──────────────────────────────────────────────────────────────┘
  
  // Even shorter with arrow =>
  List<Task> get completedTasks => tasks.where((t) => t.status == 'C').toList();
  //                           
  //              Still NO ()!
}


// ============================================================================
// WHAT HAPPENS IF YOU TRY TO ADD ()?
// ============================================================================

class WhatHappensWithParentheses {
  List<Task> tasks = [];
  
  // ❌ This is NOT a getter - it's a regular method!
  // List<Task> get pendingTasks() {  // ERROR: Getters can't have parameters
  //   return tasks.where((task) => task.status == 'P').toList();
  // }
  
  // The compiler will give you an error like:
  // "Getters cannot have parameters"
  
  
  // ✅ Correct getter
  List<Task> get pendingTasks {
    return tasks.where((task) => task.status == 'P').toList();
  }
  
  void usage() {
    // ❌ This won't work - trying to call getter as function
    // var result = pendingTasks();
    
    // You'll get error like:
    // "The getter 'pendingTasks' isn't defined"
    // or
    // "This expression has a type of 'List<Task>' so its value can't be invoked"
    
    
    // ✅ Correct usage
    var result = pendingTasks;
  }
}


// ============================================================================
// REAL-WORLD ANALOGY
// ============================================================================

/*
Think of it like asking for information:

METHOD (with parentheses):
  You: "Hey, calculate the pending tasks for me()"
       ↑ You're explicitly asking them to DO something
  
GETTER (without parentheses):
  You: "What are the pending tasks?"
       ↑ You're asking for a property/attribute

The () implies "perform this action"
No () implies "give me this value"

It's like the difference between:
  - getPendingTasks() = "Go count them for me"  (action)
  - pendingTasks      = "What are they?"         (property)
*/


// ============================================================================
// KEY RULES TO REMEMBER
// ============================================================================

/*
✅ GETTERS:
   • NO () in definition:    get pendingTasks { }
   • NO () when using:        state.pendingTasks
   • Act like properties
   • Use "get" keyword

✅ METHODS:
   • HAS () in definition:   getPendingTasks() { }
   • HAS () when using:       state.getPendingTasks()
   • Act like functions
   • No special keyword

┌────────────────────────────────────────────────────────────┐
│  GOLDEN RULE:                                              │
│  If you see "get", you'll NEVER see ()                     │
│  If you see (), you'll NEVER see "get"                     │
└────────────────────────────────────────────────────────────┘
*/


// ============================================================================
// SIDE-BY-SIDE COMPARISON
// ============================================================================

class SideBySide {
  List<Task> tasks = [];
  
  // METHOD                        vs      GETTER
  // ─────────────────────────────────────────────────────────────────
  
  // Definition:
  List<Task> getPending() { }    //      List<Task> get pending { }
  //                   ↑↑                                      
  //                Has ()                            No ()
  
  // Usage:
  void example() {
    var a = getPending();        //      var b = pending;
    //                ↑↑                                
    //             Need ()                         No ()
  }
}


// ============================================================================
// QUICK REFERENCE TABLE
// ============================================================================

/*
┌──────────────┬─────────────────────┬────────────────────────┐
│              │     METHOD          │       GETTER           │
├──────────────┼─────────────────────┼────────────────────────┤
│ Definition   │ getData() { }       │ get data { }           │
│              │         ↑↑          │          NO ()         │
│              │      Has ()         │                        │
├──────────────┼─────────────────────┼────────────────────────┤
│ Usage        │ obj.getData()       │ obj.data               │
│              │            ↑↑       │         NO ()          │
│              │         Need ()     │                        │
├──────────────┼─────────────────────┼────────────────────────┤
│ Looks like   │ Function call       │ Property access        │
├──────────────┼─────────────────────┼────────────────────────┤
│ Use when     │ Action/operation    │ Computed value         │
└──────────────┴─────────────────────┴────────────────────────┘
*/