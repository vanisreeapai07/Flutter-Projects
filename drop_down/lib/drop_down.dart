import 'package:flutter/material.dart';

class dropDown extends StatefulWidget {
  const dropDown({super.key});

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  // String dropdownValue = 'FC Barcelona';

  String defaultValue = 'FC Barcelona';
  List dropDownListData = [
    {"title": "FC Barcelona", "value": "1"},
    {"title": "Real Madrid", "value": "2"},
    {"title": "Villareal", "value": "3"},
    {"title": "Manchester City", "value": "4"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 100,
          centerTitle: true,
          title: const Text('Drop Down Menu'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 28,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isDense: true,
                    value: defaultValue,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                        child: Text('Select FootBallTeam'),
                        value: "",
                      ),
                      ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5),
                              top: BorderSide(color: Colors.grey, width: 0.5),
                              left: BorderSide(color: Colors.grey, width: 0.5),
                              right: BorderSide(color: Colors.grey, width: 0.5),
                            )),
                            child: Text(data['title']),
                          ),
                          value: data['value'],
                        );
                      }).toList(),
                    ],
                    onChanged: (newvalue) {
                      setState(() {
                        defaultValue = newvalue!;
                      });
                    }),
              ),
            )
          ],
        ));
  }
}



        //  Center(
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 8),
        //     decoration: BoxDecoration(
        //         border: Border.all(color: Colors.grey, width: 1.0)),
        //     child: DropdownButton(
        //         value: defaultValue,
        //         menuMaxHeight: 400,
        //         onChanged: (newValue) {
        //           setState(() {
        //             defaultValue = newValue as String;
        //           });
        //         },
        //         items: dropDownListData.map((valueItem) {
        //           return DropdownMenuItem(
        //             value: valueItem,
        //             child: Container(
        //               padding: const EdgeInsets.symmetric(vertical: 8),
        //               decoration: const BoxDecoration(
        //                   border: Border(
        //                       bottom:
        //                           BorderSide(color: Colors.grey, width: 1.0))),
        //               child: Text(valueItem),
        //             ),
        //           );
        //         }).toList()),
        //   ),
        // )













 // child: Column(
        //   children: [
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     DropdownButton<String>(
        //       value: dropdownValue,
        //       items: <String>[
        //         'FC Barcelona',
        //         'Real Madrid',
        //         'Villareal',
        //         'Manchester City'
        //       ].map<DropdownMenuItem<String>>((String value) {
        //         return DropdownMenuItem<String>(
        //           value: value,
        //           child: Text(
        //             value,
        //             style: const TextStyle(fontSize: 30),
        //           ),
        //         );
        //       }).toList(),
        //       onChanged: (String? newValue) {
        //         setState(() {
        //           dropdownValue = newValue!;
        //         });
        //       },
        //       // isExpanded: true,
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //   ],
        // ),