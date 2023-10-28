import 'package:flutter/material.dart';
import 'package:sample_pro1/splashScreens/splash.dart';


class spalsh2 extends StatefulWidget {
  const spalsh2({super.key});

  @override
  State<spalsh2> createState() => _spalsh2State();
}

class _spalsh2State extends State<spalsh2> {
  @override
   void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => splash())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFC930),
        ),
      ),
    );
  }
}
