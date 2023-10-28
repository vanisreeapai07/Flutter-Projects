

import 'package:educational_application/auth_screens/sign_in_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_inState();
}

class _sign_inState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        reverse: true,
        child: Container(
          padding: EdgeInsets.only(
            top: 0.6.h,
          ),
          color: Colors.black,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 4.h,
                ),
                child: Image.asset(
                  'images/img1.png',
                  width: 75.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 76.w, top: 0.5.h),
                child: Text(
                  'Name',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Your name',
                              hintStyle: TextStyle(
                                  color: const Color(0XFF364356),
                                  fontSize: 12.sp,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w100),
                              border: InputBorder.none),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 60.w),
                child: Text(
                  'Email address',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'name@eample.com',
                              hintStyle: TextStyle(
                                  color: const Color(0XFF364356),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                              border: InputBorder.none),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 68.w),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: '******',
                              hintStyle: TextStyle(
                                  color: const Color(0XFF364356),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                              border: InputBorder.none),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: const Color(0XFF5667FD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: TextButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 61))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Sign in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0.05.w, left: 22.w),
                    child: Text(
                      "You have account?",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const sign_in()));
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                            color: const Color(0XFF5667FD)),
                      )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}
