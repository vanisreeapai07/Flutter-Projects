import 'package:flutter/material.dart';
import 'package:sample_pro1/screens/ChatDetailScreen.dart';

class CallList extends StatelessWidget {
  String name;
  String date;
  String time;
  String source;
  String imageUrl;

  CallList(
      {required this.name,
      required this.imageUrl,
      required this.date,
      required this.time,
      required this.source});

  @override
  Widget build(BuildContext context) {
    final icon = source == 'call' ? Image.asset('images/call.png',height:18,width: 18) : Image.asset('images/video.png',height: 18,width: 21);
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            maxRadius: 30,
            backgroundColor:  Color(0xFFFFC930),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatDetails();
                }));
              },
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            date,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(','),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            time,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          icon,
        ]),
      ),
    );
  }
}
