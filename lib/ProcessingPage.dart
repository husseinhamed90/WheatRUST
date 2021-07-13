import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tflite/tflite.dart';
import 'package:wheatrust/Result.dart';
import 'package:wheatrust/TakePhoto.dart';

class ProcessingPage extends StatefulWidget {
  List<String> paths;
  ProcessingPage(this.paths);
  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  List output = [];
  List<List> results = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Color(0xffededef),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/wheat (2).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.31),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width - 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return (results.length < widget.paths.length)
                            ? Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 110,
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0.0, end: 1),
                                      duration:
                                          const Duration(milliseconds: 5000),
                                      builder: (contexttt, value, child) {
                                        return Container();
                                      },
                                      onEnd: () {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              Result(widget.paths, results),
                                        ));
                                      },
                                    ),
                                  ),

                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: constraints.maxHeight * 0.65,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SpinKitPulse(
                                          size: 200,
                                          color: Color(0xfff4d191),
                                          duration: const Duration(
                                              milliseconds: 3000),
                                        ),
                                        SpinKitPulse(
                                          color: Color(0xffe9d9ba),
                                          size: 400,
                                          duration: const Duration(
                                              milliseconds: 3000),
                                        ),
                                        SpinKitPulse(
                                          size: 600,
                                          color: Color(0xffe9d6bb),
                                          duration: const Duration(
                                              milliseconds: 3000),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 110,
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0.0, end: 1),
                                      duration:
                                          const Duration(milliseconds: 5000),
                                      builder: (contexttt, value, child) {
                                        return Container();
                                      },
                                      onEnd: () {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              Result(widget.paths, results),
                                        ));
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    height: constraints.maxHeight * 0.35,
                                    child: Column(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,

                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Processing..",
                                          style: TextStyle(
                                              color: Color(0xffF7B21B),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          "Scanning image From",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              height: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                        AutoSizeText(
                                          "Rust Disease may take time..",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              height: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              //bottom:  MediaQuery.of(context).size.height * 0.13,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Image.asset(
                        'Images/logo width.png',
                        height: MediaQuery.of(context).size.height * 0.09,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    ClassifyImage(widget.paths[0]).then((value) {});
  }

  int index = 0;
  Future<void> ClassifyImage(String filename) async {
    var recognitions = await Tflite.runModelOnImage(
        path: filename, // required
        imageMean: 127.0, // defaults to 117.0
        imageStd: 127.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.5, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      output = recognitions;
      results.add(output);
      index++;
      if (results.length < widget.paths.length) {
        ClassifyImage(widget.paths[index]);
      }
    });
  }
}
