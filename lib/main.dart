import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:student_info/controller/provider/provider.dart';
import 'package:student_info/database/model/data_model.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_info/screens/show_list.dart';

Future <void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(StudentModelAdapter(). typeId)){
  Hive.registerAdapter(StudentModelAdapter());
 }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => ProviderPage(),),
       // Provider<ProviderPage>(create: (context) => ImageKK(),)
        
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:const ShowList(),
        theme: ThemeData.dark(),
        
      ),
    );
  }
}