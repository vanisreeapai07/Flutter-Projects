import 'package:flutter/material.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF021F58),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, left: 60),
              child: Row(
                children: [
                  const Text(
                    'Tales of world',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Montserrat',
                        color: Color(0XFFD95DA7),
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color(0XFFD95DA7),
                        BlendMode
                            .multiply), // Replace 'Colors.red' with the color you want
                    child: ClipOval(
                      child: Image.asset(
                        'images/book1.jpg',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'WELCOME TO THE WORLD OF  BOOKS',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Color(0XFFD95DA7),
                              Color.fromARGB(255, 3, 35, 126),
                              Color(0XFFD95DA7)
                            ],
                          ).createShader(
                              const Rect.fromLTWH(10.0, 10.0, 10.0, 100))),
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
