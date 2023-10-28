import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_pro1/models/chatUsersModel.dart';
import 'package:sample_pro1/widgets/conversationList.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "images/userImage1.jpeg"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFC930),
        ),
        backgroundColor: Color(0xFFFFC930),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 20, right: 78, bottom: 1),
                child: Text(
                  'Harry',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontFamily: 'Montserrat'),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 10, 1),
                    child: Text(
                      'harrystyles@gmail.com',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              )
            ]),
        centerTitle: false,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 20, 1),
            child: Icon(
              Icons.circle_rounded,
              color: Colors.grey,
              size: 80,
            ),
          ),
          backgroundColor: Color(0xFFFFC930),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                        Text('Add Account'),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.logout_rounded,
                          color: Colors.black,
                        ),
                      ),
                      Text('Logout'),
                    ],
                  )),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print('My value 0');
              } else if (value == 1) {
                print('My value 1');
              }
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: false,
          padding: EdgeInsets.only(top: 16),
          itemBuilder: (context, index) {
            return ConversationList(
                name: chatUsers[index].name,
                messageText: chatUsers[index].messageText,
                imageUrl: chatUsers[index].imageURL);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFFFC930),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
        child: Image.asset(
          'images/profileadd.png',
          height: 22,
          width: 14.81,
        ),
      ),
    );
  }
}
