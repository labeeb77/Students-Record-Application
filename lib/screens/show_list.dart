


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_info/controller/provider/provider.dart';

import 'package:student_info/screens/widgets/add_student_widgets.dart';
import 'package:student_info/screens/widgets/list_student.dart';





class ShowList extends StatelessWidget {
  const ShowList({super.key});
  

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => Provider.of<ProviderPage>(context,listen: false).getAllStudent(),);
  
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudentWidget(),));
        },
        backgroundColor: const Color.fromARGB(255, 23, 126, 76),
        foregroundColor: Colors.white,
         icon:const Icon(Icons.add),
        label:const Text('Add Student'),
       ),
        
      body:  SafeArea(
       child: ListStudentWidget(),
      ),
    );
  }
  

  
}