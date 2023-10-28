import 'package:flutter/material.dart';

class tababr3 extends StatefulWidget {
  const tababr3({super.key});

  @override
  State<tababr3> createState() => _tababr3State();
}

class _tababr3State extends State<tababr3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          'Hotels',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
