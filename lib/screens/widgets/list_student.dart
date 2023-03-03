import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:student_info/controller/provider/provider.dart';

import 'package:student_info/screens/widgets/profile_screen.dart';

class ListStudentWidget extends StatelessWidget {
  ListStudentWidget({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ProviderPage>(context, listen: false).getAllStudent();
        Provider.of<ProviderPage>(context, listen: false).searchUser =
            Provider.of<ProviderPage>(context, listen: false).studentList;
      },
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
            child: CupertinoSearchTextField(
              controller: searchController,
              placeholder: 'Search',
              onChanged: (String text) {
                Provider.of<ProviderPage>(context, listen: false)
                    .runFilter(text);
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Consumer<ProviderPage>(
              builder: (context, value, child) {
                log('total count: ${value.studentList.length}');
                log('now Displaying count: ${value.searchUser.length}');
                if (value.studentList.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text('No Records'),
                    ),
                  );
                }
                return ListView.builder(
                    itemBuilder: (context, index) {
                      final data = value.searchUser[index];
                      log(data.name);
                      return Card(
                        child: ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.age),
                           leading:  CircleAvatar(
                            backgroundImage:FileImage(File(data.imagePath!))
                                ,
                            radius: 25,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                // delete student with alert!!

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: const Text(
                                        'Do you want to delete this record ?'),
                                    actions: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 23, 126, 76),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('No')),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 23, 126, 76),
                                          ),
                                          onPressed: () {
                                            Provider.of<ProviderPage>(context,
                                                    listen: false)
                                                .deleteStudent(index);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Deleted Successfuly !'),
                                            ));
                                          },
                                          child: const Text('Yes'))
                                    ],
                                  ),
                                );

                                //
                              },
                              icon: const Icon(Icons.delete)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        Profile_Screen(datas: data))));
                          },
                         
                        ),
                      );
                    },
                    itemCount: value.searchUser.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
