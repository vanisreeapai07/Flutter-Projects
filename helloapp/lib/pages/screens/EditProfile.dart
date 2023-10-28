import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/navigation/BottomNavigation.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModal loggedInUser = UserModal();
  // late File imageFile;
  late File imageFile = File('');

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    final imageCropper = ImageCropper();
    CroppedFile? croppedImage = await imageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 20,
    );

    if (croppedImage != null) {
      File convertedFile = File(croppedImage.path);
      setState(() {
        imageFile = convertedFile;
      });
    }
  }

  void showPhotoProfile() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload Profile Photo"),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {
                  selectImage(ImageSource.gallery);
                },
                leading: const Icon(Iconsax.gallery),
                title: const Text("Select from gallery"),
              ),
              ListTile(
                onTap: () {
                  selectImage(ImageSource.camera);
                },
                leading: const Icon(Iconsax.camera),
                title: const Text("Take a photo"),
              ),
            ]),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _fetchLoggedInUser();
  }

  void _fetchLoggedInUser() async {
    loggedInUser = await UserService.fetchLoggedInUser();
    nameController.text = loggedInUser.name ?? '';
    emailController.text = loggedInUser.email ?? '';
    passwordController.text = loggedInUser.password ?? '';
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void updateProfile() async {
    if (nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a name');
      return;
    }

    if (imageFile.path.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select a profile photo');
      return;
    }

    UploadTask uploadTask = FirebaseStorage.instance
        .ref("profilepictures")
        .child(loggedInUser.uid.toString())
        .putFile(imageFile);

    TaskSnapshot snapshot = await uploadTask;

    String imageUrl = await snapshot.ref.getDownloadURL();

    loggedInUser.profilepic = imageUrl;
    loggedInUser.name = nameController.text.trim();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(loggedInUser.uid)
        .update(loggedInUser.toMap())
        .then((value) {
      print("data uploaded");
    });

    // Navigate to the desired page after updating the profile
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation()),
    );
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
              'Edit Profile',
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
              padding: EdgeInsets.only(top: 4.h, right: 5.w, left: 5.w),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 1.h),
                          child: CircleAvatar(
                            radius: 12.w,
                            backgroundColor: ColorConstants.appBg,
                            child: CircleAvatar(
                                radius: 10.w,
                                backgroundImage: (imageFile != null &&
                                        imageFile.path.isNotEmpty)
                                    ? FileImage(imageFile)
                                    : (loggedInUser.profilepic != null &&
                                            loggedInUser.profilepic!.isNotEmpty)
                                        ? NetworkImage(loggedInUser.profilepic!)
                                            as ImageProvider<Object>?
                                        : null,
                                backgroundColor: ColorConstants.white),
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          right: -0.1.w,
                          child: GestureDetector(
                            onTap: () {
                              showPhotoProfile();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.w)),
                                color: ColorConstants.appBg,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Icon(Iconsax.edit,
                                    size: 3.w, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Name text field
                  // Name text field
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: ColorConstants.lightGrey,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        children: [
                          const Icon(Iconsax.user_edit),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: nameController,
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

                  // Email text field
                  SizedBox(
                    height: 3.h,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //   decoration: BoxDecoration(
                  //       color: ColorConstants.lightGrey,
                  //       borderRadius: BorderRadius.circular(5.w)),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Iconsax.sms_edit),
                  //         SizedBox(
                  //           width: 3.w,
                  //         ),
                  //         Expanded(
                  //           child: TextField(
                  //             controller: emailController,
                  //             enabled: false,
                  //             decoration: const InputDecoration(
                  //               hintText: 'Email',
                  //               border: InputBorder.none,
                  //             ),
                  //             style: TextStyle(
                  //               fontSize: 10.sp,
                  //               color: Colors.black,
                  //               fontFamily: 'Montserrat',
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // // Password text field
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //   decoration: BoxDecoration(
                  //       color: ColorConstants.lightGrey,
                  //       borderRadius: BorderRadius.circular(5.w)),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Iconsax.edit_2),
                  //         SizedBox(
                  //           width: 3.w,
                  //         ),
                  //         Expanded(
                  //           child: TextField(
                  //             controller: passwordController,
                  //             decoration: const InputDecoration(
                  //               hintText: 'Password',
                  //               border: InputBorder.none,
                  //             ),
                  //             style: TextStyle(
                  //               fontSize: 10.sp,
                  //               color: Colors.black,
                  //               fontFamily: 'Montserrat',
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Save & Update button
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
                        onPressed: updateProfile,
                        child: Text(
                          'Save & Update',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
