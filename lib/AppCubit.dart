import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wheatrust/CubitStates.dart';
import 'package:wheatrust/ProcessingPage.dart';
import 'package:wheatrust/Utilities.dart';

class Appcubit extends Cubit<CubitStates> {
  List output;
  File image;
  int numofimages = -1;
  bool isCameraOpen = false;
  List<String> croppedImages = [];
  List<dynamic> CommingListFromGallery = [];
  int counter = 0;
  int indexoflastimage = 0;

  Appcubit() : super(initstate());
  static Appcubit get(BuildContext context) => BlocProvider.of(context);

  void updatecomminglist(List<dynamic>dd){
    CommingListFromGallery=dd;
    numofimages=CommingListFromGallery.length;
    emit(imagescommingfromgallary());
  }
  void increament() {
    counter = 0;
    numofimages = 0;
    resetPaths();
    isCameraOpen = false;
    croppedImages = [];
    indexoflastimage = 0;
    emit(dataincreamented());
  }

  Future getImageUsingPicker(BuildContext context) async {
    File _image;
    final picker = ImagePicker();
    _image = null;
    BlocProvider.of<Appcubit>(context).isCameraOpen = true;
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await cropImage(_image.path, context);
      //List<String> SavedCurrendCroppedImagesList =  BlocProvider.of<Appcubit>(context).croppedImages;
      //BlocProvider.of<Appcubit>(context).croppedImages = [];
      if (croppedImages.length > 0) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProcessingPage(croppedImages),
        ));
      }
    }
  }
  bool isdatacomefromgallary=false;

  void changestate(){
    isdatacomefromgallary=true;
    emit(loadstate());
  }

  Future<File> cropImage(String newfile, BuildContext context) async {
    File croppedFile = await GetCroppedImage(newfile);
    indexoflastimage++;
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(indexoflastimage);

    print(croppedImages);
    await ChangeStateOfCmaeraVarible(
        croppedFile, isCameraOpen);
    if (croppedFile != null) {
      image = croppedFile;
      croppedImages.add(image.path);
    }
    emit(loadstate());
  }
}
