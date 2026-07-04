import 'package:counter_app/bloc/imagepickerbloc/bloc/image_picker_event.dart';
import 'package:counter_app/bloc/imagepickerbloc/bloc/image_picker_state.dart';
import 'package:counter_app/utils/imagepicker_utlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagepickerUtlis _imagepickerUtlis;

  ImagePickerBloc(this._imagepickerUtlis) : super(ImagePickerState()) {
    on<CameraCaptureImage>(cameraCaptureImage);
    on<GalleryImage>(_galleryImage);
  }

  // This is for Capture Image from Camera
  void cameraCaptureImage(
    CameraCaptureImage event,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await _imagepickerUtlis.cameraCapture();
    emit(state.copyWith(file: file));
  }

  // This is for Capture Image from Camera
  void _galleryImage(GalleryImage event, Emitter<ImagePickerState> emit) async {
    XFile? file = await _imagepickerUtlis.galleryImagePick();
    emit(state.copyWith(file: file));
  }
}
