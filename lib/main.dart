import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheatrust/HomePage.dart';
import 'package:wheatrust/TakePhoto.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      builder: () =>  MaterialApp(

          debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
        ),
      designSize: Size(375,812),
      //designSize: Size(812,375),
    );
  }
}
