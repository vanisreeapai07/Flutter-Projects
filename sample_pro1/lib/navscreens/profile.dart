import 'package:flutter/material.dart';
import 'package:sample_pro1/screens/account.dart';
import 'package:sample_pro1/screens/security.dart';
import 'package:sample_pro1/screens/notification.dart';
import 'package:sample_pro1/screens/languages.dart';
import 'package:sample_pro1/screens/help.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC930),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 78, 1),
                child: Text(
                  'John',
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 1),
                    child: Text(
                      'jonathan@gmail.com',
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
            child: Icon(
              Icons.circle_rounded,
              color: Colors.grey,
              size: 80,
            ),
          ),
          backgroundColor:  Color(0xFFFFC930),
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
      body: Container(
        padding: EdgeInsets.only(top: 88, left: 16, right: 16),
        child: Column(
          children: [
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        'images/acc.png',
                        width: 20,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 224, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        'images/sec.png',
                        width: 20,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Security',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 224, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => security()));
                },
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        'images/not.png',
                        width: 20,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 224, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => notification()));
                },
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        'images/lang.png',
                        width: 20,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 224, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => languages()));
                },
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        'images/help.png',
                        width: 20,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 224, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => help()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
