



import 'package:flutter/cupertino.dart';



class ImageKK with ChangeNotifier {
  



  // ImageKK(){
  //   _init();
  // }

  // late StudentModel _image = StudentModel();
  // late Box<StudentModel>_imageBox;


  // StudentModel get image {
  //   return _image;
  // }

  // Future<void> _init()async{
  //   final imageDirectory = await getApplicationDocumentsDirectory();
  //   Hive.init(imageDirectory.path);
  //   Hive.registerAdapter(StudentModelAdapter());
  //   _imageBox = await Hive.openBox<StudentModel>('image');
  //   _image = _imageBox.get(0,defaultValue: StudentModel())!;
  //   notifyListeners();

  // }

  // Future<void> _saveImage(int id,File image)async{
  //   final imagePath = await _saveImageToFile(image);
  //   _image.imagePath= imagePath;
  //   await _imageBox.put(id, _image);
  //   notifyListeners();
  // }

  // Future<String>_saveImageToFile(File image)async{
  //   final imageDirectory = await getApplicationDocumentsDirectory();
  //   final imagePath = '${imageDirectory.path}/image.png';
  //   await image.copy(imagePath);
  //   return imagePath;
  // }

  // Future<void>pickImage (ImageSource source)async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source:source);
  //   if(pickedFile != null){
  //     final image = File(pickedFile.path);
  //     await _saveImage(image);
  //   }
  // }
}