import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/onboardingData.dart';
import 'package:helloapp/pages/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  AnimatedContainer rectIndicator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 1.w),
      duration: const Duration(milliseconds: 400),
      height: 0.5.h,
      width: 12.w,
      decoration: BoxDecoration(
        color: currentPage == index
            ? ColorConstants.appBg
            : ColorConstants.offYellow,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(1.w),
          right: Radius.circular(1.w),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.h,
          backgroundColor: ColorConstants.appBg,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.appBg,
                ColorConstants.white,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: onBoardingContent.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: Image.asset(onBoardingContent[index].image),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            onBoardingContent[index].title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            onBoardingContent[index].description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  child: Column(
                    children: [
                      currentPage == onBoardingContent.length - 1
                          ? SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  _markOnboardingAsShown();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    ColorConstants.appBg,
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    'Start Messaging',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: List.generate(
                                      onBoardingContent.length - 1,
                                      (index) => rectIndicator(index),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 1.5.h),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.appBg,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.w),
                                      ),
                                    ),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: ColorConstants.white,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _markOnboardingAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasShownOnboarding', true);
  }
}
