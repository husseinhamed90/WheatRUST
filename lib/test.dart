import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wheatrust/AppCubit.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF8FBFF),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 26.w, top: 50.h),
                child: Container(
                    //padding: EdgeInsets.only(left: 26,top: 52),
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18.h,
                    )),
              ),

              SizedBox(
                height: 48.h,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 24.w),
                  child: AutoSizeText(
                    ("Your orders"),
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24.sp,
                        color: Color(0xff3D3D3D),
                        fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Container(
                      height: 21.h,
                      width: 138.w,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 31.w),
                      child: AutoSizeText(
                        ("Complete orders"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700),
                      )),
                  // SizedBox(
                  //   width: 39.h,
                  // ),
                  Spacer(),
                  Container(
                      height: 21.h,
                      width: 124.w,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 37.w),
                      child: AutoSizeText(
                        ("Pending orders"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Color(0xff000000).withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 112.h,
                        width: double.maxFinite,

                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30.r)),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                              ),
                              child: Image.network(
                                  "https://disdpbee9u48n.cloudfront.net/meals/A5caKsrtuI-1582825633.jpg"),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 11.w, vertical: 22.h),
                              height: 68.h,
                              width: 78.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 24.h, bottom: 10.h, right: 25.w),
                              width: 110.w,
                              height: 78.h,

                              child: Column(
                                children: [
                                  Container(
                                    height: 21.h,
                                    width: 118.w,
                                    child: AutoSizeText(
                                      "The Macdonalds",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Color(0xff3D3D3D)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      AutoSizeText(
                                        "Classic cheesburger",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Color(0xff3D3D3D)),
                                      ),
                                    //  Spacer(),

                                    ],
                                  ),
                                  Container(
                                    height: 21.h,
                                    width: 118.w,
                                    child: AutoSizeText(
                                      "\$23.99",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Color(0xffFE554A)),
                                    ),
                                  ),


                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                            ),

                           Spacer(),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius:
                            //     BorderRadius.all(Radius.circular(20.r)),
                            //   ),
                            //   child: Image.network(
                            //       "https://disdpbee9u48n.cloudfront.net/meals/A5caKsrtuI-1582825633.jpg"),
                            //   margin: EdgeInsets.symmetric(
                            //       horizontal: 11.w, vertical: 22.h),
                            //   height: 68.h,
                            //   width: 78.w,
                            // ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(right: 25.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20.h,),
                                  Row(
                                    children: [
                                      Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(19)),
                                              color: Color(0xffF9881F)),
                                          child: Center(
                                            child: Text("+",style: TextStyle(
                                                color: Colors.white,fontSize: 16.sp
                                            ),),
                                          )
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                        child: AutoSizeText(
                                          "1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: Color(0xff3D3D3D)),
                                        ),
                                      ),
                                      Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(19)),
                                              color: Color(0xffF9881F)),
                                          child: Center(
                                            child: Text("-",style: TextStyle(
                                                color: Colors.white,fontSize: 16.sp
                                            ),),
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 13.h,),
                                  AutoSizeText(
                                    "Order Again",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Color(0xffFE554A)),
                                  ),
                                ],
                              ),

                            )

                          ],
                        ));
                  },
                  itemCount: 6,
                ),
              )
              // SizedBox(height: 129.h,),
              // Container(
              //   color: Color(0xffC4C4C4),
              //   height: 49.h,
              //   width: 268.w,
              // ),
              // SizedBox(height: 44.h,),
              // Center(
              //   child: Container(
              //     color: Color(0xffC4C4C4),
              //    height: 49.h,
              //     width: 268.w,
              //   ),
              // ),
              // SizedBox(height: 44.h,),
              // Center(
              //   child: Container(
              //     color: Color(0xffC4C4C4),
              //     height: 49.h,
              //     width: 268.w,
              //   ),
              // ),
              // SizedBox(height: 44.h,),
              // Center(
              //   child: Container(
              //     color: Color(0xffC4C4C4),
              //     height: 49.h,
              //     width: 268.w,
              //   ),
              // ),
              // SizedBox(height: 44.h,),
            ],
          ),
        ),
      ),
      //appBar: AppBar(),
    );
  }
}
