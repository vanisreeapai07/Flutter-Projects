import 'package:flutter/material.dart';
import 'edit.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
          'Account',
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
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor:  Color(0xFFFFC930),
                radius: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
              ),
            ),
            SizedBox(
              height: 43,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              height: 48,
              width: 360,
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Image.asset(
                    'images/user.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Harry'),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              height: 48,
              width: 360,
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Image.asset(
                    'images/sms.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('harrystyles@gmail.com'),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
              height: 48,
              width: 360,
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Image.asset(
                    'images/lock.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('******'),
                ],
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
                child: Text(
                  'Edit Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Edit()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
