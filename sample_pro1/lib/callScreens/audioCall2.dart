import 'package:flutter/material.dart';

class audioCall2 extends StatefulWidget {
  const audioCall2({super.key});

  @override
  State<audioCall2> createState() => _audioCall2State();
}

class _audioCall2State extends State<audioCall2> {
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
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '00:12',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: 100,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'images/microphn.png',
                        width: 16.83,
                        height: 22,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
               height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 10),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'images/msg.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(
                      width: 44,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'images/volume.png',
                      height: 26,
                      width: 26,
                    ),
                  ),
                  SizedBox(
                    width: 44,
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
