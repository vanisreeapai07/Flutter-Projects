import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/chat_room_model.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/pages/screens/Chat.dart';
import 'package:helloapp/service/FirebaseHelper.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class SecuredChats extends StatefulWidget {
  const SecuredChats({Key? key}) : super(key: key);

  @override
  _SecuredChatsState createState() => _SecuredChatsState();
}

class _SecuredChatsState extends State<SecuredChats> {
  UserModal loggedInUser = UserModal();
  bool isSearching = false;
  bool light = false;
  bool isBiometricAuthSupported = false;

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
            'Private Chat',
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
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("chatrooms")
                  .where("users", arrayContains: loggedInUser.uid)
                  .where("isPrivate", isEqualTo: true)
                  .orderBy("createdon")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    QuerySnapshot chatRoomSnapshot =
                        snapshot.data as QuerySnapshot;

                    if (chatRoomSnapshot.docs.isEmpty) {
                      return const Center(
                        child: Text("No Chats"),
                      );
                    }

                    return ListView.builder(
                      itemCount: chatRoomSnapshot.docs.length,
                      itemBuilder: (context, index) {
                        ChatRoomModal chatRoomModal = ChatRoomModal.fromMap(
                            chatRoomSnapshot.docs[index].data()
                                as Map<String, dynamic>);

                        Map<String, dynamic> participants =
                            chatRoomModal.participants!;

                        print("participants");
                        print(participants);

                        List<String> participantsKeys =
                            participants.keys.toList();

                        print('participantsKeys');
                        print(participantsKeys);

                        participantsKeys.remove(loggedInUser.uid);

                        return FutureBuilder(
                          future: FireBaseHelper.getLoggedInUser(
                              (participantsKeys[0])),
                          builder: (context, userData) {
                            if (userData.connectionState ==
                                ConnectionState.done) {
                              if (userData.data != null) {
                                UserModal targetUser =
                                    userData.data as UserModal;
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 2.w),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 7.w,
                                        backgroundImage:
                                            (targetUser.profilepic != null)
                                                ? NetworkImage(
                                                    targetUser.profilepic
                                                        .toString(),
                                                  )
                                                : null,
                                        child: (targetUser.profilepic != null)
                                            ? null
                                            : const Icon(Iconsax.user),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Chat(
                                                        targetUser: targetUser,
                                                        chatRoom:
                                                            chatRoomModal)));
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                targetUser.name.toString(),
                                                style: TextStyle(
                                                    fontSize: 12.5.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              (chatRoomModal.lastMessage
                                                          .toString() !=
                                                      ""
                                                  ? Text(
                                                      chatRoomModal.lastMessage
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: ColorConstants
                                                            .black,
                                                        fontSize: 8.sp,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  : Text(
                                                      "Say hii..",
                                                      style: TextStyle(
                                                        color: ColorConstants
                                                            .black,
                                                        fontSize: 8.sp,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            } else {
                              return Container();
                            }
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text("No Chats"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
