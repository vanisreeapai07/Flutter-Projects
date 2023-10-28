import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:sizer/sizer.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool chatNotification = true;
  bool appNotification = true;
  bool alertMessages = false;
  bool getUpdates = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appBg,
            toolbarHeight: 10.h,
            title: const Text(
              'Notification',
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF000000),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400),
          ),
          body: SingleChildScrollView(
            child: Container(
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
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Chat notifications',
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
                                    value: chatNotification,
                                    activeColor: Colors.black,
                                    activeTrackColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        chatNotification = value;
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
                                'App notifications',
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
                                    value: appNotification,
                                    activeColor: Colors.black,
                                    activeTrackColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        appNotification = value;
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
                                'Alert messages',
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
                                    value: alertMessages,
                                    activeColor: Colors.black,
                                    activeTrackColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        alertMessages = value;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      decoration: BoxDecoration(
                          color: ColorConstants.appBg,
                          borderRadius: BorderRadius.circular(5.w)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Get Updates',
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
                                    value: getUpdates,
                                    activeColor: Colors.black,
                                    activeTrackColor: Colors.white,
                                    thumbColor: MaterialStatePropertyAll(
                                        ColorConstants.appBg),
                                    onChanged: (value) {
                                      setState(() {
                                        getUpdates = value;
                                      });
                                    }),
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
        ));
  }
}
