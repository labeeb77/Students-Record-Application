// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// import 'package:flutter/cupertino.dart';
// import 'package:hive/hive.dart';

// import '../model/data_model.dart';

// ValueNotifier <List <StudentModel>> studentListNotifier =ValueNotifier([]);

// Future<void> addStudent(StudentModel value)async{
//   final studentDB= await Hive.openBox<StudentModel>('student_db');
//   final id= await studentDB.add(value); 

//   value.id=id;

//   studentListNotifier.value.add(value);
  
  
//   studentListNotifier.notifyListeners();
  
// }

// Future<void> getAllStudent()async{
//   final studentDB= await Hive.openBox<StudentModel>('student_db');
//   studentListNotifier.value.clear();

//   studentListNotifier.value.addAll(studentDB.values);
//   studentListNotifier.notifyListeners();

// }
// Future <void> deleteStudent(int id)async{
//   final studentDB =await Hive.openBox<StudentModel>('student_db');
//   await studentDB.deleteAt(id);
//   getAllStudent();
// }
// Future<void> updateStudent(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   await studentDB.put(value.id, value);
  
//   getAllStudent();
// }