import 'package:flutter/material.dart';
import 'package:helloapp/constants/TextMsg.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/provider/DbProvider.dart';
import 'package:helloapp/provider/ScreenLockProvider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  bool secureAccount = false;
  bool securityNotification = false;

  @override
  void initState() {
    super.initState();

    DbProvider().getAuthState().then((value) {
      setState(() {
        secureAccount = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appBg,
          toolbarHeight: 10.h,
          title: const Text(
            'Security',
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
                            TextConstants.securityMessage,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                      color: ColorConstants.lightGrey,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Security notifications',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                          height: 4.h,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                                value: securityNotification,
                                activeColor: Colors.black,
                                activeTrackColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    securityNotification = value;
                                  });
                                }),
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
                      color: ColorConstants.lightGrey,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Secure Account',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                          height: 4.h,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                                value: secureAccount,
                                activeColor: Colors.black,
                                activeTrackColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    secureAccount = value;
                                  });
                                  ScreenLock(ctx: context).authenticateUser(
                                      path: 'security',
                                      value: value,
                                      message: 'Please Confirm');
                                }),
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
                      color: ColorConstants.lightGrey,
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Request account info',
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
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
                              'Delete Account',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          const Icon(Iconsax.trash)
                        ],
                      ),
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
