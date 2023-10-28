import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/pages/bottomScreens/Calls.dart';
import 'package:helloapp/pages/bottomScreens/Home.dart';
import 'package:helloapp/pages/bottomScreens/Pay.dart';
import 'package:helloapp/pages/bottomScreens/Profile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;

  final Pages = [
    const Home(),
    const Pay(),
    const Calls(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Pages[pageIndex],
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
          padding: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
              color: ColorConstants.appBg,
              borderRadius: BorderRadius.circular(5.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pageIndex == 0
                  ? SizedBox(
                      height: 5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundColor: pageIndex == 0
                                ? Colors.white
                                : Colors.transparent,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    pageIndex = 0;
                                  });
                                },
                                icon: const Icon(Iconsax.message_text)),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            width: 8.w,
                            height: 0.5.h,
                            decoration: BoxDecoration(
                                color: pageIndex == 0
                                    ? ColorConstants.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4.w)),
                          )
                        ],
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: const Icon(Iconsax.message_text)),
              pageIndex == 1
                  ? SizedBox(
                      height: 5.h,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundColor: pageIndex == 1
                                ? Colors.white
                                : Colors.transparent,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    pageIndex = 1;
                                  });
                                },
                                icon: const Icon(Iconsax.dollar_circle)),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            width: 8.w,
                            height: 0.5.h,
                            decoration: BoxDecoration(
                                color: pageIndex == 1
                                    ? ColorConstants.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4.w)),
                          )
                        ],
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                        showModalBottomSheet(
                          isScrollControlled: false,
                          barrierColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5.w)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                              heightFactor: 0.7,
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: ColorConstants.appBg,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.w),
                                      topRight: Radius.circular(5.w)),
                                ),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 5.w, right: 5.w),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const BottomNavigation()));
                                            },
                                            icon:
                                                const Icon(Iconsax.arrow_left)),
                                        Expanded(
                                          child: Text(
                                            'Add your bank account',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Iconsax.close_circle),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: const Text(
                                        'To send and receive money on hello\nyou need to add a bank account',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.profile_2user),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          'Start your payments with hello',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                      width: 68.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorConstants.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Pay()));
                                        },
                                        child: Text(
                                          'Get Started',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorConstants.black,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'BHIM,UPI',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: ColorConstants.darkGrey,
                                          fontFamily: 'Italics',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Iconsax.dollar_circle)),
              pageIndex == 2
                  ? SizedBox(
                      height: 5.h,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundColor: pageIndex == 2
                                ? Colors.white
                                : Colors.transparent,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    pageIndex = 2;
                                  });
                                },
                                icon: const Icon(Iconsax.video)),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            width: 8.w,
                            height: 0.5.h,
                            decoration: BoxDecoration(
                                color: pageIndex == 2
                                    ? ColorConstants.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4.w)),
                          )
                        ],
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      icon: const Icon(Iconsax.video)),
              pageIndex == 3
                  ? SizedBox(
                      height: 5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundColor: pageIndex == 3
                                ? Colors.white
                                : Colors.transparent,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    pageIndex = 3;
                                  });
                                },
                                icon: const Icon(Iconsax.user)),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            width: 8.w,
                            height: 0.5.h,
                            decoration: BoxDecoration(
                                color: pageIndex == 3
                                    ? ColorConstants.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4.w)),
                          )
                        ],
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                      icon: const Icon(Iconsax.user)),
            ],
          ),
        ),
      ),
    );
  }
}
