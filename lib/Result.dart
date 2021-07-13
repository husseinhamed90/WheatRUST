import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  List<dynamic> file;
  List<List> results=[];
  Result(this.file,this.results);
  
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    print(widget.file.length);
    print(widget.results);
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/resultphoto.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black12.withOpacity(0.69),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 2.0),
                      child: new Container(
                        decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfff4d191).withOpacity(0.78),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                          )),
                      height: 85,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.file=[];
                          });
                          Navigator.pop(context);
                        },
                        child: Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height*0.67,
            child: PageView.builder(
              itemCount: widget.file.length,
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemBuilder: (context, index) => Center(
                child:  Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.63,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          color: Color(0xffa1a3a2).withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            // topRight:Radius.circular(80),
                            bottomLeft: Radius.circular(125),
                            topRight: Radius.circular(80),
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.615,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          color: Color(0xffb9b9b9).withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topRight: Radius.circular(80),
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width - 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                          )),
                      child: LayoutBuilder(
                        builder: (context, constraints) => Column(
                          children: [
                            Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * 0.65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(80),
                                ),
                                image: DecorationImage(
                                  image: FileImage(File(widget.file[index])),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AutoSizeText(
                                    (widget.results[index][0]["label"]=="1 Non Healthy")?
                                    "Diseased":"Healthy",
                                    style: TextStyle(
                                        color: (widget.results[index][0]["label"]=="1 Non Healthy")?Color(0xffffd401):Color(0xff00c82f),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                  AutoSizeText(

                                    (widget.results[index][0]["label"]=="1 Non Healthy")?
                                    "هذه النبتة مصابة بمرض صدا القمح ويجب التعامل معها":"هذه النبتة ليس بها اي اصابة ",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20, height: 1),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
