import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/color.dart';
import 'package:helloapp/main.dart';
import 'package:helloapp/model/chat_room_model.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/pages/screens/Chat.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  TextEditingController searchController = TextEditingController();

  Future<ChatRoomModal?> getChatRoomModel(UserModal targetUser) async {
    ChatRoomModal? chatRoom;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .where("participants.${loggedInUser.uid}", isEqualTo: true)
        .where("participants.${targetUser.uid}", isEqualTo: true)
        .get();

    void log(String message) {
      // Log the message
      print(message);
    }

    if (snapshot.docs.isNotEmpty) {
      // fetch the existing one
      var docData = snapshot.docs[0].data();
      ChatRoomModal existingChatroom =
          ChatRoomModal.fromMap(docData as Map<String, dynamic>);

      chatRoom = existingChatroom;
    } else {
      // create a new one
      ChatRoomModal newchatroom = ChatRoomModal(
          chatroomid: uuid.v1(),
          lastMessage: "",
          lastMessageOn: DateTime.now(),
          participants: {
            loggedInUser.uid.toString(): true,
            targetUser.uid.toString(): true
          },
          users: [loggedInUser.uid.toString(), targetUser.uid.toString()],
          createdon: DateTime.now(),
          isPrivate: false);

      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(newchatroom.chatroomid)
          .set(newchatroom.toMap());

      chatRoom = newchatroom;

      log("New Chat room created");
    }
    return chatRoom;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appBg,
            title: const Text('Search'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(children: [
              TextField(
                cursorColor: ColorConstants.appBg,
                controller: searchController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: ColorConstants.appBg),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorConstants.appBg)),
                    focusColor: ColorConstants.appBg,
                    labelText: "Email Address"),
              ),
              CupertinoButton(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorConstants.appBg,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    setState(() {});
                  }),
              SizedBox(
                height: 2.h,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where("email", isEqualTo: searchController.text)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      QuerySnapshot querySnapshot =
                          snapshot.data as QuerySnapshot;

                      if (querySnapshot.docs.isNotEmpty) {
                        Map<String, dynamic> userMap = querySnapshot.docs[0]
                            .data() as Map<String, dynamic>;
                        UserModal searchedUser = UserModal.fromMap(userMap);

                        return ListTile(
                          onTap: () async {
                            ChatRoomModal? chatRoomModal =
                                await getChatRoomModel(searchedUser);

                            if (chatRoomModal != null) {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Chat(
                                  targetUser: searchedUser,
                                  chatRoom: chatRoomModal,
                                );
                              }));
                            }
                          },
                          leading: searchedUser.profilepic != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(searchedUser.profilepic!),
                                )
                              : const Icon(Icons.person), // Fallback icon
                          title: Text(searchedUser.name!),
                          subtitle: Text(searchedUser.email!),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        );
                      } else {
                        return const Text("No results found.");
                      }
                    } else if (snapshot.hasError) {
                      return const Text("Oops, something went wrong!");
                    } else {
                      return const Text("No results found");
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ]),
          ),
        ));
  }
}
