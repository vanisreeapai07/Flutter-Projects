import 'package:flutter/material.dart';
import 'package:helloapp/constants/TextMsg.dart';
import 'package:helloapp/constants/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appBg,
          toolbarHeight: 10.h,
          title: const Text(
            'Languages',
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
          padding: EdgeInsets.only(top: 8.h, left: 5.w, right: 5.w),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                      color: ColorConstants.lightGrey,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        const Icon(Iconsax.arrow_down_1)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
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
                            TextConstants.languageMessage,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
