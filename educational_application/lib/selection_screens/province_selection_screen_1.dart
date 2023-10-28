import 'package:educational_application/home_screens/home_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class province_selection extends StatefulWidget {
  const province_selection({super.key});

  @override
  State<province_selection> createState() => _province_selectionState();
}

class _province_selectionState extends State<province_selection> {
  int selectedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h, right: 18.w),
              child: Text(
                "What's your province?",
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      color: Colors.white),
                  height: 58.h,
                  width: 84.w,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h, right: 28.w),
                        child: Text(
                          'Province of Sri Lanka',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14.sp,
                            color: const Color(0XFF636D77),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.5.w),
                            child: Row(
                              children: [
                                _buildProvinceTile(index: 0, label: 'Central'),
                                SizedBox(
                                  width: 2.5.w,
                                ),
                                _buildProvinceTile(index: 5, label: 'Eastern'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.5.w),
                            child: Row(
                              children: [
                                _buildProvinceTile(
                                    index: 1, label: 'North Central'),
                                SizedBox(
                                  width: 2.5.w,
                                ),
                                _buildProvinceTile(index: 6, label: 'Northern'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.5.w),
                            child: Row(
                              children: [
                                _buildProvinceTile(
                                    index: 2, label: 'North Western'),
                                SizedBox(
                                  width: 2.5.w,
                                ),
                                _buildProvinceTile(index: 7, label: 'Western'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.5.w),
                            child: Row(
                              children: [
                                _buildProvinceTile(index: 3, label: 'Southern'),
                                SizedBox(
                                  width: 2.5.w,
                                ),
                                _buildProvinceTile(index: 8, label: 'Uva'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40.w),
                            child:
                                _buildProvinceTile(index: 4, label: 'Western'),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home_screen_1()));
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
            SizedBox(height: 3.h),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0XFF5667FD)),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildProvinceTile({required int index, required String label}) {
    return SingleChildScrollView(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: 38.w,
        decoration: BoxDecoration(
          color: selectedTileIndex == index
              ? const Color(0XFF5667FD)
              : const Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(10.48),
        ),
        child: ListTile(
          title: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selectedTileIndex == index
                    ? const Color(0xFFE6E6E6)
                    : const Color(0XFF000000),
                fontFamily: 'poppins',
                fontWeight: FontWeight.w100,
                fontSize: 12.sp,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              selectedTileIndex = index;
            });
          },
        ),
      ),
    );
  }
}
