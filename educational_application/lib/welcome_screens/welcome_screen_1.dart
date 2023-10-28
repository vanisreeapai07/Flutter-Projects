import 'package:educational_application/auth_screens/sign_in_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class first_screen extends StatefulWidget {
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
              child: Image.asset(
                'images/grade.png',
                width: 75.w,
              ),
            ),
            Text(
              "Let's find the ''A'' with us",
              style: TextStyle(
                  fontSize: 18.sp,
                  // wordSpacing: 1,
                  color: Colors.white,
                  // fontWeight: FontWeight.w500,
                  fontFamily: 'poppins'),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Please Sign in to view personalized',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'poppins', fontSize: 15.sp, color: Colors.white),
            ),
            Text(
              'recommendations',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'poppins', fontSize: 15.sp, color: Colors.white),
            ),
            SizedBox(
              height: 14.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const sign_in()));
              },
              child: Text('Sign up',
                  style: TextStyle(fontSize: 16.sp, fontFamily: 'poppins')),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(267, 61),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: const Color(0XFF5667FD),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14.sp,
                    color: const Color(0XFF5667FD),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
