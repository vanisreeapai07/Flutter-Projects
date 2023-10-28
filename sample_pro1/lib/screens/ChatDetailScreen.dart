import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_pro1/callScreens/audioCall1.dart';
import 'package:sample_pro1/callScreens/videoCall1.dart';
import 'package:sample_pro1/models/ChatMsg.dart';
import 'package:sample_pro1/navigation/bottomnav.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChatDetails> {
  List<ChatMessage> msg = [
    ChatMessage(messageContext: "helloooooo", messageType: "reciever"),
    ChatMessage(messageContext: "hiiii", messageType: "sender"),
    ChatMessage(messageContext: "your name please", messageType: "reciever"),
    ChatMessage(messageContext: "kriss", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFC930),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFC930),
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bottombar()));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/1.jpg"),
                        maxRadius: 20),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Jane Russel',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => audiocall1()));
                        },
                        icon: Image.asset(
                          'images/call.png',
                          width: 26,
                          height: 22,
                        )),
                    SizedBox(
                      width: 0,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => videoCall1()));
                        },
                        icon: Image.asset(
                          'images/video.png',
                          width: 26,
                          height: 22,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: msg.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: ((context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Align(
                    alignment: (msg[index].messageType == "reciever"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: (msg[index].messageType == "reciever"
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))
                                : BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15))),
                            color: (msg[index].messageType == "reciever"
                                ? Color(0xffD9D9D9)
                                : Color(0xFFFFC930))),
                        child: Text(msg[index].messageContext)),
                  ),
                );
              })),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: 80,
              // color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 223, 224, 224),
                        ),
                        child: Row(children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Hai..', border: InputBorder.none),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'images/happiness.png',
                                width: 24,
                                height: 24,
                              )),
                          SizedBox(
                            width: 0,
                          ),
                          PopupMenuButton(
                            offset: Offset(10, -100),
                            icon: Icon(Icons.link_rounded, color: Colors.black),
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20)), // add this line
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              new PopupMenuItem<String>(
                                  child: Container(
                                    width: 60,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child:
                                              Icon(Icons.browse_gallery_sharp),
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child:
                                              Icon(Icons.browse_gallery_sharp),
                                        ),
                                         SizedBox(
                                          width: 14,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child:
                                              Icon(Icons.browse_gallery_sharp),
                                        ),
                                         SizedBox(
                                          width: 14,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child:
                                              Icon(Icons.browse_gallery_sharp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  value: 'report'),
                            ],
                          )
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Color(0xFFFFC930),
                      elevation: 0,
                      child: Icon(
                        Icons.send_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
