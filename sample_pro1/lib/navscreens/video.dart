import 'package:flutter/material.dart';
import 'package:sample_pro1/models/callUsers.dart';
import 'package:sample_pro1/models/chatUsersModel.dart';
import 'package:sample_pro1/widgets/callList.dart';
import 'package:sample_pro1/widgets/conversationList.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  List<CallUsers> callUsers = [
    CallUsers(
        name: "Jane Russel",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage1.jpeg"),
    CallUsers(
        name: "Glady's Murphy",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage2.jpeg"),
    CallUsers(
        name: "Jorge Henry",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage3.jpeg"),
    CallUsers(
        name: "Philip Fox",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage4.jpeg"),
    CallUsers(
        name: "Debra Hawkins",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage5.jpeg"),
    CallUsers(
        name: "Jacob Pena",
        date: 'january 29',
        time: '22:12',
        source: 'videoCall',
        imageURL: "images/userImage6.jpeg"),
    CallUsers(
        name: "Andrey Jones",
        date: 'january 29',
        time: '22:12',
        source: 'call',
        imageURL: "images/userImage7.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFFFFC930),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, top: 20, right: 50, bottom: 1),
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
                    padding: const EdgeInsets.only(left: 0, right: 24),
                    // padding: const EdgeInsets.fromLTRB(0, 0, 10, 1),
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
            padding: const EdgeInsets.fromLTRB(14, 20, 20, 80),
            child: Icon(
              Icons.circle_rounded,
              color: Colors.grey,
              size: 80,
            ),
          ),
          backgroundColor: Color(0xFFFFC930),
        ),
        actions: <Widget>[
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
      body: ListView.builder(
        itemCount: callUsers.length,
        shrinkWrap: false,
        padding: EdgeInsets.only(top: 16),
        itemBuilder: (context, index) {
          final callUser = callUsers[index];
          return CallList(
            name: callUser.name,
            date: callUser.date,
            time: callUser.time,
            source: callUser.source,
            imageUrl: callUser.imageURL,
          );
        },
      ),
    );
  }
}
