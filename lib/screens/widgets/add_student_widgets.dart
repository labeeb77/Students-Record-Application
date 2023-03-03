import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_info/database/model/data_model.dart';

import '../../controller/provider/provider.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _placeController = TextEditingController();

  final _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Student'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
             const SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.width - 230,
                width: MediaQuery.of(context).size.width - 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  image: DecorationImage(
                      image: FileImage(
                        context.watch<ProviderPage>().image,
                      ),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 23, 126, 76),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () async {
                            await getImage(context);
                          },
                          icon: const Icon(Icons.edit))),
                ),
              ),

              //     CircleAvatar(
              //         backgroundImage: FileImage(

              //          context.watch<ProviderPage>().image,
              //         ),
              //         radius: 60,

              //       ),
              // ElevatedButton.icon(
              //     onPressed: () {
              //       getImage(context);
              //     },
              //     icon: const Icon(Icons.image),
              //     label: const Text('Add Photo'),
              //      style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color.fromARGB(255, 23, 126, 76),
              //   ),),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter name' : null,
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter Age' : null,
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Age',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter Place' : null,
                controller: _placeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Place',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Please Enter Phone number' : null,
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onAddStudentButtonClicked(context);
                    clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Added Successfuly !'),
                    ));
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Student'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 126, 76),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(context) async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final place = _placeController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || age.isEmpty || place.isEmpty || phone.isEmpty) {
      return;
    }
    // print('$_name $_age $_place $_phone');

    final student = StudentModel(
        name: name,
        age: age,
        place: place,
        phone: phone,
        imagePath:
            Provider.of<ProviderPage>(context, listen: false).image.path);
    Provider.of<ProviderPage>(context, listen: false).addStudent(student);
  }

  void clear() {
    _nameController.clear();
    _ageController.clear();
    _placeController.clear();
    _phoneController.clear();
  }

  Future<void> getImage(context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      log('image is null');
      return;
    } else {
      log('image not null');
      final imageTemp = File(image.path);
      Provider.of<ProviderPage>(context, listen: false).setImage(imageTemp);
    }
  }
}
