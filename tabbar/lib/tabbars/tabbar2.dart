import 'package:flutter/material.dart';

class tababr2 extends StatefulWidget {
  const tababr2({super.key});

  @override
  State<tababr2> createState() => _tababr2State();
}

class _tababr2State extends State<tababr2> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text('Trains',style: TextStyle(fontSize: 24),),
      ),
    );
  }
}