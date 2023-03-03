import 'package:hive/hive.dart';
part 'image_model.g.dart';

@HiveType(typeId: 2)
class ImageModel extends HiveObject{
  @HiveField(0)
  String? imagePath;

  ImageModel({
    this.imagePath
  });
}