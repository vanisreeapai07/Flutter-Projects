import 'package:educational_application/selection_screens/province_selection_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class garde_selection_1 extends StatefulWidget {
  const garde_selection_1({super.key});

  @override
  State<garde_selection_1> createState() => _garde_selection_1State();
}

class _garde_selection_1State extends State<garde_selection_1> {
  String dropdownvalue = 'Grade 1 - 5';
  String dropdownvalue2 = 'Grade 6 - 9';
  String dropdownvalue3 = 'Grade 10 - 11';
  String dropdownvalue4 = 'Grade 12 - 13';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 24.w),
                child: Text(
                  "What's your grade?",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: GestureDetector(
                    child: DropdownButton(
                      isExpanded: true,
                      menuMaxHeight: 350,
                      borderRadius: BorderRadius.circular(8),
                      value: dropdownvalue,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      iconSize: 8.w,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Grade 1 - 5',
                          child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0.7.h),
                                    child: Text(
                                      'Grade 1 - 5',
                                      style: TextStyle(
                                          color: Color(0XFF636D77),
                                          fontSize: 16.sp),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: '',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/paint.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Arts',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                            value: 'Grade 6 - 9',
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/science.png',
                                  height: 6.h,
                                  width: 6.h,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Science',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            )),
                        DropdownMenuItem<String>(
                          value: 'Grade 10 - 11',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/maths.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Maths',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                            value: 'Grade 12 - 13',
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/commerce.png',
                                  height: 6.h,
                                  width: 6.h,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Commerce',
                                      style: TextStyle(
                                          color: const Color(0XFF636D77),
                                          fontSize: 16.sp),
                                    )),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: DropdownButton(
                    isExpanded: true,
                    menuMaxHeight: 350,
                    borderRadius: BorderRadius.circular(8),
                    value: dropdownvalue2,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    iconSize: 8.w,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Grade 6 - 9',
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(top: 0.7.h),
                                  child: Text(
                                    'Grade 6 - 9',
                                    style: TextStyle(
                                        color: const Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: '',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/paint.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Arts',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 6 - 5',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/science.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Science',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          )),
                      DropdownMenuItem<String>(
                        value: 'Grade 10 - 11',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/maths.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Maths',
                                  style: TextStyle(
                                      color: Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 12 - 13',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/commerce.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Commerce',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: DropdownButton(
                    isExpanded: true,
                    menuMaxHeight: 350,

                    borderRadius: BorderRadius.circular(8),
                    // itemHeight: Checkbox.width,
                    value: dropdownvalue3,

                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    iconSize: 8.w,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue3 = newValue!;
                      });
                    },

                    items: [
                      DropdownMenuItem<String>(
                        value: 'Grade 10 - 11',
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(top: 0.7.h),
                                  child: Text(
                                    'Grade 10 - 11',
                                    style: TextStyle(
                                        color: const Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: '',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/paint.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Arts',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 6 - 9',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/science.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Science',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          )),
                      DropdownMenuItem<String>(
                        value: 'Grade 1 - 5',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/maths.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Maths',
                                  style: TextStyle(
                                      color: Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 12 - 13',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/commerce.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Commerce',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: DropdownButton(
                    isExpanded: true,
                    menuMaxHeight: 350,

                    borderRadius: BorderRadius.circular(8),
                    // itemHeight: Checkbox.width,
                    value: dropdownvalue4,

                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    iconSize: 8.w,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue4 = newValue!;
                      });
                    },

                    items: [
                      DropdownMenuItem<String>(
                        value: 'Grade 12 - 13',
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(top: 0.7.h),
                                  child: Text(
                                    'Grade 12 - 13',
                                    style: TextStyle(
                                        color: const Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: '',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/paint.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Arts',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 6 - 9',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/science.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Science',
                                  style: TextStyle(
                                      color: const Color(0XFF636D77),
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          )),
                      DropdownMenuItem<String>(
                        value: 'Grade 10 - 11',
                        child: Row(
                          children: [
                            Image.asset(
                              'images/maths.png',
                              height: 6.h,
                              width: 6.h,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Maths',
                                  style: TextStyle(
                                      color: Color(0XFF636D77),
                                      fontSize: 16.sp),
                                )),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                          value: 'Grade 1 - 5',
                          child: Row(
                            children: [
                              Image.asset(
                                'images/commerce.png',
                                height: 6.h,
                                width: 6.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Commerce',
                                    style: TextStyle(
                                        color: Color(0XFF636D77),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => province_selection()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF5667FD),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Set the border radius
                  ),
                  fixedSize: const Size(267, 61),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 4.h),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF5667FD)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
