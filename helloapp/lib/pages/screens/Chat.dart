import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/main.dart';
import 'package:helloapp/model/chat_room_model.dart';
import 'package:helloapp/model/message_model.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/pages/bottomScreens/Pay.dart';
import 'package:helloapp/service/AudioCall.dart';
import 'package:helloapp/service/VideoCall.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatefulWidget {
  final UserModal targetUser;
  final ChatRoomModal chatRoom;
  const Chat({Key? key, required this.targetUser, required this.chatRoom})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  UserModal loggedInUser = UserModal();
  bool chatPrivate = false;

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();
  }

  void _fetchLoggedInUser() async {
    loggedInUser = await UserService.fetchLoggedInUser();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Read the stored value of chatPrivate
    bool storedChatPrivate = prefs.getBool('chatPrivate') ?? false;

    // Update the chatPrivate value if it's different from the stored value
    if (chatPrivate != storedChatPrivate) {
      setState(() {
        chatPrivate = storedChatPrivate;
      });
    }

    // Update the stored value of chatPrivate
    await prefs.setBool('chatPrivate', chatPrivate);

    // Rest of your code...
  }

  TextEditingController messageController = TextEditingController();

  void sendMessage() async {
    String msg = messageController.text.trim();
    messageController.clear();

    if (msg != "") {
      // sent message
      MessageModal newMessage = MessageModal(
        messageId: uuid.v1(),
        sender: loggedInUser.uid.toString(),
        createdon: DateTime.now(),
        text: msg,
        seen: false,
      );

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatRoom.chatroomid)
          .collection("messages")
          .doc(newMessage.messageId)
          .set(newMessage.toMap());

      widget.chatRoom.lastMessage = msg;
      widget.chatRoom.lastMessageOn = newMessage.createdon;

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatRoom.chatroomid)
          .set(widget.chatRoom.toMap());

      void log(String message) {
        // Log the message
        print(message);
      }

      log("message sent!");
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorConstants.appBg,
            toolbarHeight: 8.h,
            flexibleSpace: SafeArea(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Center(
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Iconsax.arrow_left)),
                  SizedBox(
                    width: 2.w,
                  ),
                  widget.targetUser.profilepic != null
                      ? CircleAvatar(
                          backgroundColor: ColorConstants.white,
                          backgroundImage: NetworkImage(
                              widget.targetUser.profilepic.toString()),
                        )
                      : const Icon(Icons.person),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Text(
                      widget.targetUser.name.toString(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AudioCall()));
                      },
                      icon: const Icon(Iconsax.call)),
                  SizedBox(
                    width: 3.w,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VideoCall()));
                      },
                      icon: const Icon(Iconsax.video)),
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
                                Icon(Iconsax.safe_home),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Private')
                              ],
                            ))
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        var ret = showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Private Chat Settings'),
                                content: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return ListTile(
                                    trailing: Switch(
                                      value: chatPrivate,
                                      onChanged: (bool value) async {
                                        setState(() {
                                          chatPrivate =
                                              value; // Update chatPrivate based on the switch value
                                        });

                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        await prefs.setBool(
                                            'chatPrivate', chatPrivate);

                                        // Update the "isPrivate" field in the Firebase Firestore document
                                        FirebaseFirestore.instance
                                            .collection("chatrooms")
                                            .doc(widget.chatRoom.chatroomid)
                                            .update({
                                          "isPrivate": chatPrivate,
                                        });
                                      },
                                    ),
                                    title: const Text('Private'),
                                  );
                                }),
                              );
                            });
                      }
                    },
                  ),
                ]),
              ),
            )),
          ),
          body: Stack(
            children: [
              // chat goes
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chatrooms")
                      .doc(widget.chatRoom.chatroomid)
                      .collection("messages")
                      .orderBy("createdon", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot dataSnapshort =
                            snapshot.data as QuerySnapshot;

                        return ListView.builder(
                            itemCount: dataSnapshort.docs.length,
                            padding: EdgeInsets.only(top: 2.h),
                            itemBuilder: ((context, index) {
                              MessageModal currentMessage =
                                  MessageModal.fromMap(dataSnapshort.docs[index]
                                      .data() as Map<String, dynamic>);
                              return Padding(
                                padding: currentMessage.sender ==
                                        loggedInUser.uid.toString()
                                    ? EdgeInsets.only(left: 20.w)
                                    : EdgeInsets.only(right: 20.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 0.4.h),
                                  child: Align(
                                    alignment: (currentMessage.sender ==
                                            loggedInUser.uid.toString()
                                        ? Alignment.topRight
                                        : Alignment.topLeft),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.5.h),
                                        decoration: BoxDecoration(
                                            borderRadius: (currentMessage.sender ==
                                                    loggedInUser.uid.toString()
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(3.w),
                                                    topRight:
                                                        Radius.circular(3.w),
                                                    bottomLeft:
                                                        Radius.circular(3.w))
                                                : BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(3.w),
                                                    topRight:
                                                        Radius.circular(3.w),
                                                    bottomRight:
                                                        Radius.circular(3.w))),
                                            color: (currentMessage.sender ==
                                                    loggedInUser.uid.toString()
                                                ? const Color(0xFFFFC930)
                                                : const Color(0xffD9D9D9))),
                                        child: Text(currentMessage.text.toString())),
                                  ),
                                ),
                              );
                            }));
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                              "Oops something went wrong..!\nPlease check your internet connection"),
                        );
                      } else {
                        return const Center(
                          child: Text("Say hii to your new friend.."),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: ColorConstants.lightGrey,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: messageController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    hintText: 'Message',
                                    hintStyle: TextStyle(
                                        color: Color(0xFF959595),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Iconsax.happyemoji),
                              ),
                              PopupMenuButton(
                                  icon: const Icon(Iconsax.link_215),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.w)),
                                  offset: const Offset(-20, -90),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: Container(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  width: 11.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorConstants.appBg),
                                                  child: const Icon(
                                                      Iconsax.image1),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  width: 11.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorConstants.appBg),
                                                  child: const Icon(
                                                      Iconsax.folder_open5),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  width: 11.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorConstants.appBg),
                                                  child: const Icon(
                                                      Iconsax.profile_2user5),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    isScrollControlled: false,
                                                    barrierColor: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      5.w)),
                                                    ),
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return FractionallySizedBox(
                                                        heightFactor: 0.7,
                                                        child: Container(
                                                          height: 50.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                ColorConstants
                                                                    .appBg,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5.w),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5.w)),
                                                          ),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5.w,
                                                                    right: 5.w),
                                                            child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 3.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              const Icon(Iconsax.arrow_left)),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Add your bank account',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black,
                                                                              fontFamily: 'Montserrat'),
                                                                        ),
                                                                      ),
                                                                      IconButton(
                                                                        onPressed:
                                                                            () {},
                                                                        icon: const Icon(
                                                                            Iconsax.close_circle),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4.w),
                                                                    child:
                                                                        const Text(
                                                                      'To send and receive money on hello\nyou need to add a bank account',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 3.h,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          icon:
                                                                              const Icon(Iconsax.user)),
                                                                      SizedBox(
                                                                        width:
                                                                            1.w,
                                                                      ),
                                                                      Text(
                                                                        'Start your payments with hello',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              Colors.black,
                                                                          fontFamily:
                                                                              'Montserrat',
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
                                                                    child:
                                                                        ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            ColorConstants.white,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(2.w),
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => const Pay()));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Get Started',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              ColorConstants.black,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            10.sp,
                                                                        color: ColorConstants
                                                                            .darkGrey,
                                                                        fontFamily:
                                                                            'Italics',
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                child: Container(
                                                  width: 11.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorConstants.appBg),
                                                  child: const Icon(
                                                      Iconsax.dollar_circle4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ];
                                  })
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          sendMessage();
                        },
                        backgroundColor: ColorConstants.appBg,
                        shape: const CircleBorder(),
                        elevation: 0,
                        child: const Icon(Iconsax.send_1),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
