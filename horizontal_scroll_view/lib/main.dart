import 'package:flutter/material.dart';

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
          length: 7,
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.only(top: 34, left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(fontSize: 24),
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey,),
                      hintText: 'Search for apps and games',hintStyle: const TextStyle(fontSize: 18),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 226, 219, 219),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const TabBar(
                    isScrollable: true,
                    indicatorColor: Color.fromARGB(255, 2, 58, 3),
                    labelColor: Color.fromARGB(255, 2, 58, 3),
                    unselectedLabelColor: Color.fromARGB(255, 109, 106, 106),
                    tabs: [
                      Tab(
                        text: 'For you',
                      ),
                      Tab(
                        text: 'Top charts',
                      ),
                      Tab(
                        text: 'Kids',
                      ),
                      Tab(
                        text: 'Events',
                      ),
                      Tab(
                        text: 'Premium',
                      ),
                      Tab(
                        text: 'Categories',
                      ),
                      Tab(
                        text: 'Editors choice',
                      ),
                    ],
                  ),
                  const Expanded(child: TabBarView(children: []))
                ],
              ),
            ),
          )),
    );
  }
}
