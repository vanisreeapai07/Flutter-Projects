import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/pages/screens/EditProfile.dart';
import 'package:helloapp/pages/screens/Help.dart';
import 'package:helloapp/pages/screens/Languages.dart';
import 'package:helloapp/pages/screens/Notifications.dart';
import 'package:helloapp/pages/screens/Security.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appBg,
          toolbarHeight: 10.h,
          title: const Text(
            'Setting',
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
            padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.security_safe,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Security()));
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.lock_circle,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Security',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications()));
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.notification_bing,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Languages()));
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.global,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Help()));
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.support,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Help',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
