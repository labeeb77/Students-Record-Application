// import 'package:flutter/material.dart';
// import 'package:student_info/database/functions/db_function.dart';
// import 'package:student_info/screens/widgets/add_student_widgets.dart';
// import 'package:student_info/screens/widgets/list_student_widgets.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     getAllStudent();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Info'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             AddStudentWidget(),
//             const Expanded(child: ListStudentWidget())
      
//         ]),
//       ),
//     );
//   }
// }