import 'package:image_picker/image_picker.dart';

class ImagepickerUtlis {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryImagePick() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
