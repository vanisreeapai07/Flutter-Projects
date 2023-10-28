import 'package:flutter/material.dart';

class languages extends StatefulWidget {
  const languages({super.key});

  @override
  State<languages> createState() => _languagesState();
}

class _languagesState extends State<languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color(0xFFFFC930),
        centerTitle: true,
        title: Text(
          'Languages',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              'images/back.png',
              width: 25,
              height: 17,
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 120, left: 22),
        child: Column(
          children: [
            Container(
              width: 349,
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 40),
                child: Row(
                  children: [
                    Text(
                      'English',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Image.asset(
                      'images/arrowdown.png',
                      height: 8.43,
                      width: 17,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 88,
            ),
            Container(
              width: 326,
              height: 70,
              decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10 ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/danger.png',
                      height: 18,
                      width: 19.15,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        'Currently language english only. On the next update other languages will be added',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
