import 'dart:io';

import 'package:counter_app/bloc/imagepickerbloc/bloc/image_picker_bloc.dart';
import 'package:counter_app/bloc/imagepickerbloc/bloc/image_picker_event.dart';
import 'package:counter_app/bloc/imagepickerbloc/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagepickerScreen extends StatefulWidget {
  const ImagepickerScreen({super.key});

  @override
  State<ImagepickerScreen> createState() => _ImagepickerScreenState();
}

class _ImagepickerScreenState extends State<ImagepickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisAlignment: .center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  if (state.file == null) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(GalleryImage());
                      },

                      child: CircleAvatar(child: Icon(Icons.browse_gallery)),
                    );
                  } else {
                    return Image.file(File(state.file!.path.toString()));
                  }
                },
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  if (state.file == null) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(
                          CameraCaptureImage(),
                        );
                      },
                      child: CircleAvatar(child: Icon(Icons.camera)),
                    );
                  } else {
                    return Image.file(File(state.file!.path.toString()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
