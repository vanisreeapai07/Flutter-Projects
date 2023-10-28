import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  const navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text(
                'Drawer header',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 10,
              controller: ScrollController(),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Item 1'),
                    ),
                    ListTile(
                      title: Text('Item 2'),
                    ),
                    ListTile(
                      title: Text('Item 3'),
                    ),
                    ListTile(
                      title: Text('Item 4'),
                    ),
                    ListTile(
                      title: Text('Item 5'),
                    ),
                    ListTile(
                      title: Text('Item 6'),
                    ),
                    ListTile(
                      title: Text('Item 7'),
                    ),
                    ListTile(
                      title: Text('Item 8'),
                    ),
                    ListTile(
                      title: Text('Item 9'),
                    ),
                    ListTile(
                      title: Text('Item 10'),
                    ),
                    ListTile(
                      title: Text('Item 11'),
                    ),
                    ListTile(
                      title: Text('Item 12'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
