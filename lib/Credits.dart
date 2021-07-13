

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/creditsphoto.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.75),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.3) * 0.05,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height * 0.3) * 0.6,
                      width: MediaQuery.of(context).size.width - 70,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Images/aculogo.png',
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Spacer(),
                          Image.asset(
                            'Images/logo0.png',
                            height: MediaQuery.of(context).size.height * 0.11,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height * 0.3) * 0.35,
                      // width: MediaQuery.of(context).size.width-70,
                      child: Center(
                        child: Text(
                          "Credits",
                          style:
                          TextStyle(color: Colors.yellow, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    getrow("HUSSEIN HAMED", "Images/hussein.JPG",
                        MediaQuery.of(context).size.height * 0.1),
                    getrow("MOHAMED ASHRAF", "Images/ashraf.JPG",
                        MediaQuery.of(context).size.height * 0.1),
                    getrow("AHMED OSAMA", "Images/ahmed.JPG",
                        MediaQuery.of(context).size.height * 0.1),
                    getrow("KHOLOD IBRAHEM", "Images/kholod.JPG",
                        MediaQuery.of(context).size.height * 0.1),
                    getrow("NORHAN ALAA", "Images/norhan.JPG",
                        MediaQuery.of(context).size.height * 0.1),
                    getrow("MAHMOUD FATHY", "Images/medo.jpg",
                        MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                //padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.135,
                              height: ( MediaQuery.of(context).size.height * 0.2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: ExactAssetImage("Images/doctor.png"),
                                ),
                              ),
                            ),
                          SizedBox(width: 27,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Under Supervision of",
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height*0.025,
                                    color: Color(0xffdbbc2a),
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                "Dr.Mohamed Mamdouh",
                                style:
                                TextStyle(fontSize: MediaQuery.of(context).size.height*0.025, color: Color(0xfffffff9)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getrow(String name, String image, double hight) {
    return Container(
      height: hight,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: hight,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(width: (MediaQuery.of(context).size.width ) * 0.05,),
                    Container(
                      width: (MediaQuery.of(context).size.width ) * 0.4,
                      height: hight * 0.85,

                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage(image),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: (MediaQuery.of(context).size.width) * 0.4,
                      child: FittedBox(
                        child: AutoSizeText(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width ) * 0.15,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
