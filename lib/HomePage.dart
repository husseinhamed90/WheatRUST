import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheatrust/TakePhoto.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/wheat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.80),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('Images/logo.png',fit: BoxFit.cover,height: (MediaQuery.of(context).size.height)*0.45,width: MediaQuery.of(context).size.width,),
              SpinKitCircle(
                color: Colors.white,
                size: 100,
              ),
              SizedBox(height: 70,),
              Container(
                width: MediaQuery.of(context).size.width-110,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1),
                  duration: const Duration(milliseconds: 3000),
                  builder: (contexttt, value, child) {
                    return  Container();
                  },
                  onEnd: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TakePhoto(),));
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
