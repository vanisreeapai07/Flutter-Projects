import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool ChatNotification = true;

  bool AppNotification = true;
  bool AlertMessages = true;
  bool getUpdates = false;

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
          'Notification',
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
              height: 120,
            ),
            Center(
              child: Opacity(
                opacity: ChatNotification ? 1.0 : 0.5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                  height: 48,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Chat Notifications',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 78,
                      ),
                      Switch(
                          value: ChatNotification,
                          activeColor: Colors.black,
                          activeTrackColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              ChatNotification = value;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Opacity(
              opacity: AppNotification ? 1.0 : 0.5,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'App Notofications',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 78,
                    ),
                    Switch(
                        value: AppNotification,
                        activeColor: Colors.black,
                        activeTrackColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            AppNotification = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Opacity(
              opacity: AlertMessages ? 1.0 : 0.5,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Alert messages',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Switch(
                        value: AlertMessages,
                        activeColor: Colors.black,
                        activeTrackColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            AlertMessages = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Opacity(
              opacity: getUpdates ? 1.0 : 0.5,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color:  Color(0xFFFFC930),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Get Updates',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Switch(
                        value: getUpdates,
                        activeColor:  Color(0xFFFFC930),
                        activeTrackColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            getUpdates = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
