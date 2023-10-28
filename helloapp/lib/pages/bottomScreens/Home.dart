import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/model/chat_room_model.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/pages/screens/Chat.dart';
import 'package:helloapp/pages/screens/Search.dart';
import 'package:helloapp/pages/screens/Setting.dart';
import 'package:helloapp/provider/ChatLockProvider.dart';
import 'package:helloapp/provider/DbProvider.dart';
import 'package:helloapp/service/FirebaseHelper.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModal loggedInUser = UserModal();
  bool isSearching = false;
  bool privateChat = false;
  bool disposed = false; // Add a disposed flag

  void _fetchLoggedInUser() async {
    loggedInUser = await UserService.fetchLoggedInUser();
    if (!disposed) {
      // Check if the widget is still mounted
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();

    DbProvider().getPrivateChatState().then((value) {
      setState(() {
        privateChat = value;
      });
    });
  }

  @override
  void dispose() {
    disposed = true; // Set the disposed flag to true
    super.dispose();
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
                  backgroundImage:
                      NetworkImage(loggedInUser.profilepic.toString()),
                  backgroundColor: ColorConstants.white,
                ),
                SizedBox(
                  width: 4.w,
                ),
                isSearching
                    ? Expanded(
                        child: Center(
                          child: TextField(
                            autofocus: true,
                            decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                isDense: true),
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                      )
                    : Expanded(
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
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                    icon: Icon(isSearching
                        ? Iconsax.close_circle
                        : Iconsax.search_normal_1)),
                SizedBox(
                  width: 2.w,
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.w)),
                  offset: const Offset(0, 50),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 0,
                        child: Container(
                          child: const Row(
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
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Container(
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.setting,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Settings'),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                      var ret = showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Make your chats private'),
                              content: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return ListTile(
                                  trailing: Switch(
                                    value: privateChat,
                                    onChanged: (bool value) {
                                      setState(() {
                                        privateChat = value;
                                      });
                                      ChatLock(cntx: context).authenticatePR(
                                        path: 'secureChat',
                                        value: value,
                                        message: 'Please Confirm',
                                      );
                                    },
                                  ),
                                  title: const Text('Secure chats'),
                                );
                              }),
                            );
                          });
                    } else if (value == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Setting()));
                    }
                  },
                )
              ],
            ),
          )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              if (privateChat)
                SizedBox(
                  height: 2.h,
                ),
              if (privateChat)
                GestureDetector(
                  onTap: () {
                    DbProvider().getPrivateChatState().then((value) {
                      if (value == true) {
                        ChatLock(cntx: context).authenticatePR(
                          path: 'chat',
                          message: 'Please authenticate to access chat',
                        );
                      } else {
                        Null;
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 6.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: ColorConstants.appBg,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Hidden Chats',
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )),
                        const Icon(Iconsax.security_safe5),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: privateChat
                        ? FirebaseFirestore.instance
                            .collection("chatrooms")
                            .where("users", arrayContains: loggedInUser.uid)
                            .where("isPrivate", isEqualTo: false)
                            .orderBy("createdon")
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("chatrooms")
                            .where("users", arrayContains: loggedInUser.uid)
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
                              ChatRoomModal chatRoomModal =
                                  ChatRoomModal.fromMap(
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
                                            vertical: 1.h, horizontal: 2.w),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 7.w,
                                              backgroundImage:
                                                  (targetUser.profilepic !=
                                                          null)
                                                      ? NetworkImage(
                                                          targetUser.profilepic
                                                              .toString(),
                                                        )
                                                      : null,
                                              child: (targetUser.profilepic !=
                                                      null)
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
                                                              targetUser:
                                                                  targetUser,
                                                              chatRoom:
                                                                  chatRoomModal)));
                                                },
                                                child: Container(
                                                  color: ColorConstants
                                                      .transperant,
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        targetUser.name
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.5.sp,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      (chatRoomModal.lastMessage
                                                                  .toString() !=
                                                              ""
                                                          ? Text(
                                                              chatRoomModal
                                                                  .lastMessage
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color:
                                                                    ColorConstants
                                                                        .black,
                                                                fontSize: 8.sp,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )
                                                          : Text(
                                                              "Say hii..",
                                                              style: TextStyle(
                                                                color:
                                                                    ColorConstants
                                                                        .black,
                                                                fontSize: 8.sp,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              chatRoomModal.lastMessageOn !=
                                                      null
                                                  ? DateFormat('hh:mm a')
                                                      .format(chatRoomModal
                                                          .lastMessageOn!)
                                                  : '',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 7.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
          backgroundColor: ColorConstants.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.w),
              topRight: Radius.circular(2.w),
              bottomRight: Radius.circular(2.w),
            ),
          ),
          child: const Icon(Iconsax.profile_add),
        ),
      ),
    );
  }
}
