import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/sample/calls.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
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
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.appBg,
          toolbarHeight: 10.h,
          flexibleSpace: SafeArea(
              child: Container(
            padding: EdgeInsets.only(left: 5.w, right: 2.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 8.w,
                  backgroundColor: ColorConstants.white,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${loggedInUser.name}",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${loggedInUser.email}",
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.w)),
                    offset: const Offset(0, 50),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Add Account'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.lock_1,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Private chat'),
                            ],
                          ),
                        ),
                      ];
                    })
              ],
            ),
          )),
        ),
        body: ListView.builder(
            itemCount: callContent.length,
            shrinkWrap: false,
            padding: EdgeInsets.only(top: 1.h),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Row(children: [
                  CircleAvatar(
                    radius: 8.w,
                    backgroundImage: NetworkImage(callContent[index].imageURL),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          callContent[index].name,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Icon(
                              callContent[index].madeBy == "currentUser"
                                  ? Icons.call_made
                                  : Icons.call_received,
                              size: 3.w,
                              color: callContent[index].status == "completed"
                                  ? ColorConstants.green
                                  : ColorConstants.red,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '${callContent[index].date},',
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              callContent[index].time,
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(callContent[index].source == "call"
                        ? Iconsax.call
                        : Iconsax.video),
                  )
                ]),
              );
            }),
      ),
    );
  }
}
