import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imgPicker = ImagePicker();

  XFile? file = await imgPicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  print('NO IMAGE SELECTED');
}

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
