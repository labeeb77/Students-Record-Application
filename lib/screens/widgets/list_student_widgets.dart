// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:student_info/database/functions/db_function.dart';
// import 'package:student_info/screens/widgets/profile_screen.dart';

// import '../../database/model/data_model.dart';

// class ListStudentWidget extends StatefulWidget {
//   const ListStudentWidget({super.key});

//   @override
//   State<ListStudentWidget> createState() => _ListStudentWidgetState();
// }

// class _ListStudentWidgetState extends State<ListStudentWidget> {
//       TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {

//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder: (BuildContext context, List<StudentModel> studentList,
//           Widget? child) {
//             List<StudentModel> filteredList = studentList.where((student) {
//               String name = student.name.toLowerCase();
//               String searchQuery = searchController.text.toLowerCase();
//               return name.contains(searchQuery);

//             }).toList();
//         return Column(
//           children: [
//              Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CupertinoSearchTextField(
//                   controller: searchController,
//                   placeholder: 'Search',
//                   onChanged: (String value) {
//                     setState(() {
                      
//                     });
//                   },
//                 ),
//               ),
//              const SizedBox(height: 25,),


//             Expanded(
//               child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     final data = filteredList[index];
//                     return Card(
//                       child: ListTile(
//                         title: Text(data.name),
//                         subtitle: Text(data.age),
//                         trailing: IconButton(
//                             onPressed: () {
//                               deleteStudent(index);
//                             },
//                             icon: const Icon(Icons.delete)),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) =>
//                                       Profile_Screen(datas: data))));
//                         },
//                         leading: const CircleAvatar(
//                           backgroundImage: AssetImage('asset/image/profile.jpg'),
//                           radius: 25,
//                         ),
//                       ),
//                     );
//                   },
                 
//                   itemCount: filteredList.length),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
