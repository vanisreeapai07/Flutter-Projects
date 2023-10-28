import 'package:flutter/material.dart';
import 'package:helloapp/constants/TextMsg.dart';
import 'package:helloapp/constants/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appBg,
          toolbarHeight: 10.h,
          title: const Text(
            'Hello Support',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xFF000000),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 4.h, left: 5.w, right: 5.w),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.5.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.offWhite,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.danger5,
                          size: 6.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Text(
                            TextConstants.helpMessage,
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: ColorConstants.msgTxt,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                      color: ColorConstants.offYellow,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Help Centre',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                      color: ColorConstants.offYellow,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                      color: ColorConstants.offYellow,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'App info',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
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
    );
  }
}
