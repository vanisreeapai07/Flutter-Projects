import 'package:flutter/material.dart';
import 'tabbars/tabbar.dart';
import 'tabbars/tabbar2.dart';
import 'tabbars/tabbar3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 20,
              backgroundColor: Colors.lightGreen,
              elevation: 0,
            ),
            body: Container(
              decoration: const BoxDecoration(color: Colors.lightGreen),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    autofocus: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const TabBar(
                    indicatorColor: Colors.indigo,
                    labelColor: Colors.indigo,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.flight_rounded,
                        ),
                        text: 'Flights',
                      ),
                      Tab(icon: Icon(Icons.train_rounded), text: 'Trains'),
                      Tab(
                        icon: Icon(Icons.restaurant),
                        text: 'Hotels',
                      ),
                    ],
                  ),
                  const Expanded(
                      child: TabBarView(
                          children: [tabbar1(), tababr2(), tababr3()])),
                ],
              ),
            ),
          )),
    );
  }
}
