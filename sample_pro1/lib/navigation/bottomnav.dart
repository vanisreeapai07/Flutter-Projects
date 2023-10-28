import 'package:flutter/material.dart';
import 'package:sample_pro1/navscreens/pay.dart';
import 'package:sample_pro1/navscreens/chat.dart';
import 'package:sample_pro1/navscreens/profile.dart';
import 'package:sample_pro1/navscreens/video.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int pageIndex = 0;

  final Pages = [
    const chat(),
    const pay(),
    const video(),
    const profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[pageIndex],
      bottomNavigationBar: Container(
          height: 60,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: const BoxDecoration(
            color: Color(0xFFFFC930),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: pageIndex == 0 ? Colors.white : Colors.transparent),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    icon: Image.asset(
                      'images/msg.png',
                      width: 24,
                      height: 24,
                    )),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: pageIndex == 1 ? Colors.white : Colors.transparent,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                    showModalBottomSheet(
                      isScrollControlled: false,
                      barrierColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.7,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFC930),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'images/back.png',
                                            height: 16,
                                            width: 16,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Add your bank account',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'images/close.png',
                                            height: 16,
                                            width: 16,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'To send and receive money on hello,you need to add a bank account',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context, pageIndex == 0);
                                          },
                                          icon: Image.asset(
                                            'images/people.png',
                                            height: 18,
                                            width: 18,
                                          )),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Text(
                                        'Start your payments with hello,',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 48,
                                    width: 349,
                                    child: ElevatedButton(
                                      child: Text(
                                        'Get Started',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onSurface: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => pay()));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Center(
                                    child: Text(
                                      'BHIM,UPI',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontFamily: 'Italics',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // child: pay(),
                          ),
                        );
                      },
                    );
                  },
                  icon: Image.asset('images/dollar.png', width: 24, height: 24),
                ),
              ),

              // Container(
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: pageIndex == 1 ? Colors.white : Colors.transparent),
              //   child: IconButton(
              //       onPressed: () {
              //         setState(() {
              //           pageIndex = 1;
              //         });
              //       },
              //       icon: Image.asset('images/dollar.png', width: 24, height: 24,)),
              // ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: pageIndex == 2 ? Colors.white : Colors.transparent),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    icon: Image.asset(
                      'images/video.png',
                      width: 24,
                      height: 24,
                    )),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: pageIndex == 3 ? Colors.white : Colors.transparent),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    icon: Image.asset(
                      'images/profile.png',
                      width: 24,
                      height: 24,
                    )),
              ),
            ],
          )),
    );
  }
}
