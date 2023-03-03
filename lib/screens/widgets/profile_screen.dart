import 'dart:io';

import 'package:flutter/material.dart';

import 'package:student_info/database/model/data_model.dart';
import 'package:student_info/screens/widgets/update_student.dart';

// ignore: camel_case_types
class Profile_Screen extends StatelessWidget {
  final StudentModel datas;

  const Profile_Screen({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundImage: FileImage(File(datas.imagePath!)),
                  radius: 70,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Name : ${datas.name}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text('Age : ${datas.age}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text('Place : ${datas.place}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text('Phone : ${datas.phone}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  UpdateStudent(studentData: datas))));
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit list'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 23, 126, 76)))
              ],
            )));
  }
}
