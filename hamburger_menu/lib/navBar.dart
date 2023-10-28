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
              padding: EdgeInsets.only(
                right: 200,
                top: 80,
                bottom: 60,
              ),
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: AssetImage('images/img2.png'),
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
                      leading: Icon(Icons.contacts_rounded),
                      title: Text('Contacts'),
                    ),
                    ListTile(
                      leading: Icon(Icons.event),
                      title: Text('Events'),
                    ),
                    ListTile(
                      leading: Icon(Icons.note),
                      title: Text('Notes'),
                    ),
                    ListTile(
                      leading: Icon(Icons.stairs),
                      title: Text('Steps'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_rounded),
                      title: Text('Authors'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Flutter documentation'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star_border),
                      title: Text('useful links'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                    ListTile(
                      leading: Icon(Icons.report),
                      title: Text('Report an  issue'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
