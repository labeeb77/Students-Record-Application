import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:student_info/database/model/data_model.dart';

class ProviderPage with ChangeNotifier {
  List<StudentModel> studentList = [];
  List<StudentModel> searchUser = [];

  void runFilter(String textValue) {
    List<StudentModel> allResult = [];
    if (textValue.isEmpty) {
      allResult = studentList;
    } else {
      allResult = studentList
          .where((element) => element.name.contains(textValue.toLowerCase()))
          .toList();
    }
    searchUser = allResult;
    notifyListeners();
  }



  Future<void> addStudent(StudentModel value) async {
    log("Adding Student");
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);

    value.id = id;

    getAllStudent();
    log("Adding Student Completed");
    notifyListeners();
  }

  Future<void> getAllStudent() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentList.clear();

    studentList.addAll(studentDB.values);
    notifyListeners();

  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
    getAllStudent();
    notifyListeners();
  }

  Future<void> updateStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.put(value.id, value);
    getAllStudent();
    notifyListeners();
  }

  File? _image;

  void setImage(File image) {
    log('setting image');
    _image = image;
    notifyListeners();
  }

  File get image {
    return _image ?? File('asset/image/profile.jpg');
  }
}
