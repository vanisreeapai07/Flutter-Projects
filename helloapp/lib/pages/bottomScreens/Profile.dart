import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/pages/auth/Login.dart';
import 'package:helloapp/pages/screens/EditProfile.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserModal loggedInUser = UserModal();

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();
  }

  void _fetchLoggedInUser() async {
    loggedInUser = await UserService.fetchLoggedInUser();
    setState(() {});
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
            'Profile',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xFF000000),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.w)),
                offset: const Offset(0, 50),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.lock_1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Log out'),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    FirebaseAuth.instance.signOut().then((value) => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()))
                        });
                  }
                }),
            SizedBox(
              width: 2.w,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 4.h, left: 5.w, right: 5.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12.w,
                    backgroundColor: ColorConstants.appBg,
                    child: CircleAvatar(
                      radius: 11.w,
                      backgroundImage:
                          NetworkImage(loggedInUser.profilepic.toString()),
                      backgroundColor: ColorConstants.white,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        children: [
                          const Icon(Iconsax.user),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: false,
                              controller: TextEditingController(
                                  text: "${loggedInUser.name}"),
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                              ),
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
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        children: [
                          const Icon(Iconsax.sms),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: false,
                              controller: TextEditingController(
                                  text: "${loggedInUser.email}"),
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
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
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        children: [
                          const Icon(Iconsax.lock),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: false,
                              obscureText: true,
                              controller: TextEditingController(
                                  text: "${loggedInUser.password}"),
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
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
                    height: 9.h,
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.appBg,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile()));
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
