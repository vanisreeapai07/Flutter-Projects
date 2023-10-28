import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedindex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 24, color: Colors.black);

  static const List<Widget> options = <Widget>[
    Text(
      'Item 1',
      style: optionStyle,
      selectionColor: Colors.blue,
    ),
    Text(
      'Item 2',
      style: optionStyle,
    ),
    Text(
      'Item 3',
      style: optionStyle,
    ),
    Text(
      'Item 4',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Bottom Nvaigation',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: options.elementAt(selectedindex),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        )),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Item 1'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.backpack,
                ),
                label: 'Item 2'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note,
                ),
                label: 'Item 3'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Item 4'),
          ],
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedindex,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          iconSize: 29,
          selectedFontSize: 20,
          unselectedFontSize: 20,
          unselectedItemColor: const Color.fromARGB(255, 80, 78, 78),
        ),
      ),
    );
  }
}
