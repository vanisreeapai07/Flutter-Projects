import 'package:flutter/material.dart';

class security extends StatefulWidget {
  const security({super.key});

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
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
          'Security',
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
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 84,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.asset(
                      'images/danger.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(''),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Center(
              child: Container(
                width: 360,
                height: 48,
                decoration: BoxDecoration(
                    color: Color(0xFFFF5252),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14,left: 46,bottom: 15),
                  child: Row(
                    children: [
                      Text(
                        'Delete Account',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Image.asset('images/trash.png',width: 19.8, height: 22,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 160),
            Container(
              height: 48,
              width: 360,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFFFFC930),
                    ),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Privacy policy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(
                        'images/arrowRight.png',
                        height: 16.74,
                        width: 24.69,
                      )
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
