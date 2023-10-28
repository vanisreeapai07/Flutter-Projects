import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/navigation/BottomNavigation.dart';
import 'package:helloapp/pages/auth/Login.dart';
import 'package:helloapp/pages/onBoarding/OnBoarding.dart';
import 'package:helloapp/provider/DbProvider.dart';
import 'package:helloapp/provider/ScreenLockProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _checkOnboardingStatus();
    });
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasShownOnboarding = prefs.getBool('hasShownOnboarding') ?? false;

    if (!hasShownOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
      prefs.setBool('hasShownOnboarding', true);
    } else {
      if (FirebaseAuth.instance.currentUser != null) {
        _authenticateUser();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      }
    }
  }

  void _authenticateUser() {
    DbProvider().getAuthState().then((value) {
      if (value == false) {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        }
      } else {
        ScreenLock(ctx: context).authenticateUser(
          path: 'splash',
          message: 'Please authenticate to access app',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(right: 1.h),
              child: Image.asset(
                'assets/images/helloappborder.png',
                width: 30.w,
              ),
            ),
            Positioned(
              bottom: 3.h,
              right: 9.w,
              child: Lottie.asset('assets/anim/helloapp.json', width: 16.w),
            ),
          ],
        ),
      ),
    );
  }
}
