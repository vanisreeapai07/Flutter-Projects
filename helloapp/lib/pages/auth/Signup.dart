import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/navigation/BottomNavigation.dart';
import 'package:helloapp/pages/auth/Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    // Regular expression pattern to match against the email input
    final pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

  bool validateFields() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter your name');
      return false;
    }

    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter your email');
      return false;
    }

    if (!isValidEmail(emailController.text)) {
      Fluttertoast.showToast(msg: 'Please enter a valid email');
      return false;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter your password');
      return false;
    }

    if (passwordController.text.length < 6) {
      Fluttertoast.showToast(
          msg: 'Password should be at least 6 characters long');
      return false;
    }

    return true;
  }

  Future signUp() async {
    if (!validateFields()) {
      return;
    }

    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      addUserDetails(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error creating account');
    }
  }

  Future addUserDetails(String name, String email, String password) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModal userModal = UserModal();

    userModal.email = user!.email;
    userModal.uid = user.uid;
    userModal.name = nameController.text.trim();
    userModal.password = passwordController.text.trim();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModal.toMap());

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorConstants.appBg,
            toolbarHeight: 10.h,
            flexibleSpace: SafeArea(
                child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 2.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Signup',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Create your account',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: const Text('Enter your Name'),
                  ),
                  SizedBox(
                    height: 0.5.h,
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
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Color(0xFF939393)),
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: const Text('Enter your Email'),
                  ),
                  SizedBox(
                    height: 0.5.h,
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
                          Expanded(
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Color(0xFF939393)),
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: const Text('Enter your Password'),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0xFF939393)),
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
                    height: 5.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: ColorConstants.appBg,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: TextButton(
                        onPressed: () {
                          signUp();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.sp,
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
                  ),
                  SizedBox(
                    height: 10.5.h,
                  ),
                  Center(
                    child: Text(
                      'Or connect with',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: ColorConstants.appBg,
                          borderRadius: BorderRadius.circular(5.w)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.google),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: ColorConstants.appBg,
                          borderRadius: BorderRadius.circular(5.w)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.facebook),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
