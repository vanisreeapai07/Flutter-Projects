import 'package:flutter/material.dart';

class tabbar1 extends StatefulWidget {
  const tabbar1({super.key});

  @override
  State<tabbar1> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar1> {
  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text('Flights',style: TextStyle(fontSize: 24),),
      ),
    );
  }
}