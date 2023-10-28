import 'package:flutter/material.dart';

import 'splash2.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => spalsh2())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          child: Center(
            child: Container(
              // padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(70),
                border: Border.all(width: 20.0, color: Colors.amber),
              ),

              child: Image.asset(
                'images/icon1.png',
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
