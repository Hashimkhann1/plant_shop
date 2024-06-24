



import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> pickImage() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }

}