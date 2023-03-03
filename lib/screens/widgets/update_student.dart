
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:student_info/controller/provider/provider.dart';
import 'package:student_info/database/model/data_model.dart';

class UpdateStudent extends StatelessWidget {
  final StudentModel studentData;

  const UpdateStudent({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: studentData.name);
    final ageController = TextEditingController(text: studentData.age);
    final placeController = TextEditingController(text: studentData.place);
    final phoneController = TextEditingController(text: studentData.phone);
    // final photo = FileImage(File(studentData.imagePath!));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: FileImage(File(studentData.imagePath!)),
              radius: 60,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Age'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: placeController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Place'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Phone'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  StudentModel newDetails = StudentModel(
                    name: nameController.text,
                    age: ageController.text,
                    place: placeController.text,
                    phone: phoneController.text,
                    id: studentData.id,
                  );

                  Provider.of<ProviderPage>(context, listen: false)
                      .updateStudent(newDetails);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.update_outlined),
                label: const Text('Update'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 126, 76),
                ))
          ],
        ),
      ),
    );
  }
}
