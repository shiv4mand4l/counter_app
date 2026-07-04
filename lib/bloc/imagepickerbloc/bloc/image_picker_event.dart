import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class CameraCaptureImage extends ImagePickerEvent {}

class GalleryImage extends ImagePickerEvent {}
