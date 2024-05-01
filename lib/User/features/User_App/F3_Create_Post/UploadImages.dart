import 'dart:io';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Bloc/images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ImagesUpload {
  Future<void> uploadImages(BuildContext context, Bloc_Image blocImage) async {
    final picker = ImagePicker();
    List<XFile> pickedImages = await picker.pickMultiImage(
      maxWidth: 800,
    );

    if (pickedImages != null) {
      List<File> imageFiles =
          pickedImages.map((image) => File(image.path)).toList();

      if (blocImage.Images.length + imageFiles.length > 10) {
        print("You  can't upload more than 10 images ");
      } else {
        blocImage.Images = blocImage.Images + imageFiles;
      }
    }
  }

  Future<void> uploadImageFromCamera(
      BuildContext context, Bloc_Image blocImage) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);

      if (blocImage.Images.length + 1 > 10) {
        print("You can't upload more than 10 images");
      } else {
        blocImage.Images.add(imageFile);
      }
    }
  }
}
