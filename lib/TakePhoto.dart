import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:tflite/tflite.dart';
import 'package:wheatrust/Credits.dart';
import 'package:wheatrust/LifecycleEventHandler.dart';
import 'package:wheatrust/ProcessingPage.dart';
import 'package:wheatrust/Utilities.dart';
import 'package:wheatrust/Widgets/BuildButton.dart';

class TakePhoto extends StatefulWidget {
  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

  List output;
  File image;
  int numofimages = -1;
  bool isCameraOpen = false;
  List<String> croppedImages = [];
  List<dynamic> CommingListFromGallery = [];
  int counter = 0;
  int indexoflastimage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }
  void initState() {
    loadmodel().then((value) {});
    super.initState();
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(resumeCallBack: () async {
      if (isCameraOpen == true) {
        counter = 0;
        numofimages = -1;
        resetPaths();
        croppedImages = [];
        indexoflastimage = 0;
      }
      else {
        if (!isCameraOpen) {
          if (croppedImages.length > 0 && croppedImages.length == numofimages) {
            List<String> SavedList = croppedImages;
            counter = 0;
            numofimages = -1;
            resetPaths();
            croppedImages = [];
            indexoflastimage = 0;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProcessingPage(SavedList),
            ));
          }
          else {
            List<String> SavedList = [];
            CommingListFromGallery = await GetImages();
            numofimages = CommingListFromGallery.length;
            CommingListFromGallery.forEach((element) {
              SavedList.add(element);
            });
            if (SavedList.length > 0) {
              if (croppedImages.length < SavedList.length) {
                await _cropImage(SavedList[indexoflastimage]);
              }
            }
          }
        }
      }
    }));
  }

  Future getImageUsingPicker() async {
    File _image;
    final picker = ImagePicker();
    _image = null;
    isCameraOpen = true;
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await _cropImage(_image.path);
      List<String> SavedCurrendCroppedImagesList = croppedImages;
      croppedImages = [];
      if (SavedCurrendCroppedImagesList.length > 0) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProcessingPage(SavedCurrendCroppedImagesList),
        ));
      }
    }
  }

  Future<File> _cropImage(String newfile) async {
    File croppedFile = await GetCroppedImage(newfile);
    indexoflastimage++;
    await ChangeStateOfCmaeraVarible(croppedFile,isCameraOpen);
    if (croppedFile != null) {
      image = croppedFile;
      croppedImages.add(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Images/takephoto.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.65),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.topRight,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Credits(),
                      ));
                    },
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: MediaQuery.of(context).size.height * 0.05,
                        icon: Icon(
                          Icons.info_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Credits(),
                          ));
                        }),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height * 0.44) * 0.4,
                  child: BuildButton(
                      (MediaQuery.of(context).size.height * 0.5) * 0.4, "Camera",
                          () async {
                        await getImageUsingPicker();
                      }),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height * 0.63) * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height * 0.44) * 0.4,
                  child: BuildButton(
                      (MediaQuery.of(context).size.height * 0.5) * 0.4,
                      "Gallery", () async {
                    setState(() {
                      counter = 0;
                      numofimages = 0;
                      resetPaths();
                      isCameraOpen = false;
                      croppedImages = [];
                      indexoflastimage = 0;
                    });
                    await GetImagesFromGallery();
                  }),
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Column(
                    children: [
                      Spacer(),
                      Image.asset(
                        'Images/logo width.png',
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
