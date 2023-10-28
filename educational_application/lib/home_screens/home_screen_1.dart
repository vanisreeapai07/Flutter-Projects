import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class home_screen_1 extends StatefulWidget {
  const home_screen_1({super.key});

  @override
  State<home_screen_1> createState() => _home_screen_1State();
}

class _home_screen_1State extends State<home_screen_1> {
  bool isVisible = false;
  bool visibility = false;

  Color buttonColor = Colors.white; // Initial color

  void _changeButtonColor() {
    setState(() {
      buttonColor = Color(0xff5667fd); // New color when pressed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),

              Container(
                  height: 28.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0XFFF4F5F9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, top: 2.h),
                            child: Container(
                              height: 12.h,
                              width: 60.w,
                              // color: Colors.grey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.5.h, right: 10.w),
                                    child: Text(
                                      'Good evening!',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 20.sp,
                                          color: const Color(0xFF263238)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      'Hardline Scott',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16.sp,
                                          color: const Color(0xFF455A64)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.5.h, right: 6.w),
                            child: Container(
                              height: 14.h,
                              width: 24.w,
                              child: Image.asset(
                                'images/propic.png',
                                height: 18.h,
                                width: 4.w,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.5.w, top: 1.h),
                            child: Container(
                              width: 68.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.only(top: 0.2.h, left: 4.w),
                                child: Row(
                                  children: [
                                    Text(
                                      'Search your teacher',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          color: const Color(0xFF636D77)),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Container(
                                      height: 6.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff5667fd),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.search_rounded,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('images/icon.png'))
                        ],
                      )
                    ],
                  )),

              // SizedBox(
              //   height: 3.h,
              // ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text(
                            'Popular Teachers',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.w),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Image.asset('images/drop.png')),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVisible,
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Container(
                          height: 30.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: BorderRadius.circular(2.w)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1.h, right: 80.w),
                                child: Text(
                                  'Area',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: _changeButtonColor,
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Island',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Color(0xff364356)),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Province',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Districts',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 74.w),
                                child: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'All Subjects',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Biology',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Chemistry',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Physics',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Science for Technology',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      // height: isVisible ? 6.h : 0,
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 24.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: Container(
                                        height: 16.h,
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFCF687D),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: Image.asset(
                                          'images/man1.png',
                                          height: 20.h,
                                          width: 80.w,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Cassie Valdez',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF364356)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12.5.w),
                                    child: Text(
                                      'Biology',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w100,
                                          color: const Color(0xFF364356)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: Container(
                                        height: 16.h,
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF413435),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: Image.asset(
                                          'images/man2.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: Text(
                                      'Paul Simon',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF364356)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: Text(
                                      'Chemistry',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w100,
                                          color: const Color(0xFF364356)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: Container(
                                        height: 16.h,
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE7E7E7),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: Center(
                                          child: Image.asset(
                                            'images/man3.png',
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.5.w),
                                    child: Text(
                                      'Graham',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF364356)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: Text(
                                      'Biology',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w100,
                                          color: const Color(0xFF364356)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text(
                            'Popular Institutions',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 22.w),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                setState(() {
                                  visibility = !visibility;
                                });
                              },
                              child: Image.asset('images/drop.png')),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: visibility,
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Container(
                          height: 12.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: BorderRadius.circular(2.w)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1.h, right: 80.w),
                                child: Text(
                                  'Area',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Island',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Province',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(
                                          'Districts',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      height: 26.h,
                      width: 98.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/grp1.png',
                            height: 38.h,
                            width: 40.w,
                          ),
                          SizedBox(width: 0.5.w),
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 16.w, top: 2.h),
                                  child: Text(
                                    'Victory College',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 16.sp,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 32.w),
                                  child: Image.asset(
                                    'images/star.png',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 28.w),
                                  child: Text(
                                    'Bio Science',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 18.w),
                                  child: Text(
                                    'Studying how CBD',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Text(
                                  'awareness and availability',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF364356)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: Text(
                                    'as it related to pain',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 1.5.w),
                                  child: Text(
                                    'management alternatives',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      height: 26.h,
                      width: 98.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/grp1.png',
                            height: 38.h,
                            width: 40.w,
                          ),
                          SizedBox(width: 0.5.w),
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 16.w, top: 2.h),
                                  child: Text(
                                    'Victory College',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 16.sp,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 32.w),
                                  child: Image.asset(
                                    'images/star.png',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 28.w),
                                  child: Text(
                                    'Bio Science',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 18.w),
                                  child: Text(
                                    'Studying how CBD',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Text(
                                  'awareness and availability',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF364356)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: Text(
                                    'as it related to pain',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 1.5.w),
                                  child: Text(
                                    'management alternatives',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF364356)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void unscrollable() {}
