import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tflite/tflite.dart';



const channel = MethodChannel('service');
Future<List<dynamic>> GetImages() async {
  try {
    return await channel.invokeMethod('getImages');
  } on PlatformException catch (ex) {
    print(ex.message);
  }
}
Future<void> resetPaths() async {
  try {
    await channel.invokeMethod('resetPaths');
  } on PlatformException catch (ex) {
    print(ex.message);
  }
}
Future<void> GetImagesFromGallery() async {
  try {
    await channel.invokeMethod('Gallery');

  } on PlatformException catch (ex) {
    print(ex.message);
  }
}
// void ResetVaribles(int counter,int numofimages,List croppedImages,int indexoflastimage){
//   counter = 0;
//   numofimages = -1;
//   resetPaths();
//   croppedImages = [];
//   indexoflastimage = 0;
// }
Future<File>GetCroppedImage(String newfile)async{
  return await ImageCropper.cropImage(
    sourcePath: newfile,
    aspectRatio: CropAspectRatio(ratioX: 300, ratioY: 300),
    cropStyle: CropStyle.rectangle,
    androidUiSettings: AndroidUiSettings(
        hideBottomControls: true,
        toolbarTitle: 'Crop Planet',
        toolbarColor: Colors.yellow.shade800,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.ratio4x3,
        lockAspectRatio: true,
        showCropGrid: false),
  );
}
Future<void> loadmodel()async{
  await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt"
  );
}
Future<bool> ChangeStateOfCmaeraVarible(File file,bool isCameraOpen) async {
  //setState(() {
    if (file == null)
      isCameraOpen = true;
    else
      isCameraOpen = false;
  //});
}
Future<bool> changeStateOfisCameraOpen(File file,bool isCameraOpen) async {
  // setState(() {
  if (file == null)
    isCameraOpen = true;
  else
    isCameraOpen = false;
  //});
}