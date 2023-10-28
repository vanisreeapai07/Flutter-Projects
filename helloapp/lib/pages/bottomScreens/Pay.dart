import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  // bool isSearching = false;

  // // String currentOption = options[0];
  // String? payments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFC930),
        ),
        backgroundColor: const Color(0xFFFFC930),
        // title: Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon: Image.asset(
        //           'images/back.png',
        //           height: 16,
        //           width: 16,
        //         )),
        //     const SizedBox(
        //       width: 8,
        //     ),
        //     isSearching
        //         ? const Expanded(
        //             child: Center(
        //             child: TextField(
        //               autofocus: true,
        //               decoration: InputDecoration(
        //                 hintText: 'Search',
        //                 border: InputBorder.none,
        //                 isDense: true,
        //               ),
        //               style: TextStyle(fontSize: 20),
        //             ),
        //           ))
        //         : const Expanded(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsets.only(top: 16, left: 72),
        //                   child: Text(
        //                     "Select your bank",
        //                     style: TextStyle(
        //                         fontSize: 18,
        //                         color: Colors.black,
        //                         fontFamily: 'Montserrat',
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //     IconButton(
        //         onPressed: () {
        //           setState(() {
        //             isSearching = !isSearching;
        //           });
        //         },
        //         icon: isSearching
        //             ? const Icon(
        //                 Icons.close_rounded,
        //                 color: Colors.black,
        //               )
        //             : const Icon(
        //                 Icons.search_rounded,
        //                 color: Colors.black,
        //               )),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //   ],
        // ),
        centerTitle: false,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 19, top: 20),
        // child: Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         const Text(
        //           'Popular banks',
        //           style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.black,
        //               fontFamily: 'Montserrat',
        //               fontWeight: FontWeight.w500),
        //         ),
        //         const SizedBox(
        //           width: 166,
        //         ),
        //         const Text(
        //           'UPI',
        //           style: TextStyle(
        //               fontSize: 20,
        //               color: Colors.black,
        //               fontFamily: 'Montserrat',
        //               fontWeight: FontWeight.w500),
        //         ),
        //         const SizedBox(
        //           width: 2,
        //         ),
        //         Image.asset(
        //           'images/upi.png',
        //           height: 26,
        //           width: 26,
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 26,
        //     ),
        //     Container(
        //       height: 80,
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           Container(
        //             width: 70,
        //             child: Column(
        //               children: [
        //                 Image.asset(
        //                   'images/baroda.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 const Text(
        //                   'Bank of Baroda',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w600),
        //                 )
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Container(
        //             width: 70,
        //             child: Column(
        //               children: [
        //                 Image.asset(
        //                   'images/hdfc.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 const Text(
        //                   'HDFC BANK LTD',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w600),
        //                 )
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Container(
        //             width: 70,
        //             child: Column(
        //               children: [
        //                 Image.asset(
        //                   'images/icici.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 const Text(
        //                   'ICICI Bank',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w600),
        //                 )
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Container(
        //             width: 70,
        //             child: Column(
        //               children: [
        //                 Image.asset(
        //                   'images/sbi.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 const Text(
        //                   'State Bank Of India',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w600),
        //                 )
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Container(
        //             width: 70,
        //             child: Column(
        //               children: [
        //                 Image.asset(
        //                   'images/fd.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 const Text(
        //                   'FEDERAL Bank',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w600),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 30,
        //       width: double.infinity,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.only(right: 26, left: 10),
        //       child: Column(
        //         children: [
        //           const Padding(
        //             padding: EdgeInsets.only(right: 30),
        //             child: Text(
        //               'Payment methods',
        //               style: TextStyle(
        //                   fontSize: 20,
        //                   color: Colors.black,
        //                   fontFamily: 'Montserrat',
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 40,
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
        //             height: 58,
        //             width: 360,
        //             decoration: BoxDecoration(
        //                 color: const Color(0x40FFC930),
        //                 borderRadius: BorderRadius.circular(15)),
        //             child: Container(
        //               child: ListTile(
        //                 // contentPadding: EdgeInsets.only(right: ),
        //                 title: const Text(
        //                   'Master Card',
        //                   style: TextStyle(
        //                       fontSize: 18,
        //                       color: Colors.black,
        //                       fontFamily: 'Montserrat',
        //                       fontWeight: FontWeight.w500),
        //                 ),
        //                 leading: Image.asset(
        //                   'images/master.png',
        //                   height: 20,
        //                   width: 20,
        //                 ),
        //                 trailing: Radio(
        //                     value: 'Master Card',
        //                     groupValue: payments,
        //                     onChanged: (String? value) {
        //                       setState(() {
        //                         payments = value;
        //                       });
        //                     }),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
        //             height: 58,
        //             width: 360,
        //             decoration: BoxDecoration(
        //                 color: const Color(0x40FFC930),
        //                 borderRadius: BorderRadius.circular(15)),
        //             child: ListTile(
        //               title: const Text(
        //                 'PayPal',
        //                 style: TextStyle(
        //                     fontSize: 18,
        //                     color: Colors.black,
        //                     fontFamily: 'Montserrat',
        //                     fontWeight: FontWeight.w500),
        //               ),
        //               leading: Image.asset(
        //                 'images/pay.png',
        //                 height: 20,
        //                 width: 20,
        //               ),
        //               trailing: Radio(
        //                   value: 'PayPal',
        //                   groupValue: payments,
        //                   onChanged: (String? value) {
        //                     setState(() {
        //                       payments = value;
        //                     });
        //                   }),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Container(
        //             padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
        //             height: 58,
        //             width: 360,
        //             decoration: BoxDecoration(
        //                 color: const Color(0x40FFC930),
        //                 borderRadius: BorderRadius.circular(15)),
        //             child: ListTile(
        //               title: const Text(
        //                 'Visa',
        //                 style: TextStyle(
        //                     fontSize: 18,
        //                     color: Colors.black,
        //                     fontFamily: 'Montserrat',
        //                     fontWeight: FontWeight.w500),
        //               ),
        //               leading: Image.asset(
        //                 'images/master.png',
        //                 height: 20,
        //                 width: 20,
        //               ),
        //               trailing: Radio(
        //                   value: 'Visa',
        //                   groupValue: payments,
        //                   onChanged: (String? value) {
        //                     setState(() {
        //                       payments = value;
        //                     });
        //                   }),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 80,
        //           ),
        //           Container(
        //             height: 48,
        //             width: 360,
        //             child: ElevatedButton(
        //               style: ElevatedButton.styleFrom(
        //                 primary: const Color.fromARGB(255, 223, 224, 224),
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(15),
        //                 ),
        //               ),
        //               onPressed: () {},
        //               child: const Text(
        //                 'Continue',
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: Colors.black,
        //                   fontFamily: 'Montserrat',
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
