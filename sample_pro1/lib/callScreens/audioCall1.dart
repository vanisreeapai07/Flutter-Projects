import 'package:flutter/material.dart';
import 'package:sample_pro1/callScreens/audioCall2.dart';

class audiocall1 extends StatefulWidget {
  const audiocall1({super.key});

  @override
  State<audiocall1> createState() => _audiocall1State();
}

class _audiocall1State extends State<audiocall1> {
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFFC930),
              Color.fromARGB(255, 235, 198, 95),
              Colors.white70,
              Color(0XFFffffff),
            ])),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 70, 10, 50),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Image.asset(
                        'images/arrowLeft.png',
                        height: 16.74,
                        width: 24.69,
                      )),
                ),
                SizedBox(
                  width: 250,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 70, 10, 50),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/video.png',
                        width: 28,
                        height: 24,
                      )),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 120),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'John',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      'Calling...',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 140),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => audioCall2()));
                    },
                    backgroundColor: Color(0xFF44DE5C),
                    child: Image.asset(
                      'images/call.png',
                      height: 24,
                      width: 23.96,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color(0XFFFF5252),
                    child: Image.asset(
                      'images/call.png',
                      height: 24,
                      width: 23.96,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
