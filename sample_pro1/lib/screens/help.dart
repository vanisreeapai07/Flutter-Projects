import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor:  Color(0xFFFFC930),
        centerTitle: true,
        title: Text(
          'hello Support',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 70,
                width: 319,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Hi ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Harry',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF9747FF),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              ', thanks for using our chat application. If you face any kind of issues report us',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 358,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Color(0x40FFC930),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 16),
                      child: Text(
                        'Help Centre',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 358,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Color(0x40FFC930),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 16),
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 358,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Color(0x40FFC930),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, top: 16),
                            child: Text(
                              'App Info',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
