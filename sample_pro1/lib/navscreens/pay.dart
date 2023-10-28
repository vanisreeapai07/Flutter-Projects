import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_pro1/screens/languages.dart';

class pay extends StatefulWidget {
  const pay({super.key});

  @override
  State<pay> createState() => _payState();
}

// List<String> options = ['Master Card', 'PayPal', 'Visa'];

class _payState extends State<pay> {
  bool isSearching = false;

  // String currentOption = options[0];
  String? payments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFC930),
        ),
        backgroundColor: Color(0xFFFFC930),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'images/back.png',
                  height: 16,
                  width: 16,
                )),
            SizedBox(
              width: 8,
            ),
            isSearching
                ? Expanded(
                    child: Center(
                    child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 72),
                          child: Text(
                            "Select your bank",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
                icon: isSearching
                    ? Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        centerTitle: false,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 19, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular banks',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 166,
                ),
                Text(
                  'UPI',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 2,
                ),
                Image.asset(
                  'images/upi.png',
                  height: 26,
                  width: 26,
                ),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/baroda.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          'Bank of Baroda',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/hdfc.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          'HDFC BANK LTD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/icici.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          'ICICI Bank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/sbi.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          'State Bank Of India',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/fd.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          'FEDERAL Bank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(right: 26, left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      'Payment methods',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                    height: 58,
                    width: 360,
                    decoration: BoxDecoration(
                        color: Color(0x40FFC930),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      child: ListTile(
                        // contentPadding: EdgeInsets.only(right: ),
                        title: Text(
                          'Master Card',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        leading: Image.asset(
                          'images/master.png',
                          height: 20,
                          width: 20,
                        ),
                        trailing: Radio(
                            value: 'Master Card',
                            groupValue: payments,
                            onChanged: (String? value) {
                              setState(() {
                                payments = value;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                    height: 58,
                    width: 360,
                    decoration: BoxDecoration(
                        color: Color(0x40FFC930),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Text(
                        'PayPal',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      leading: Image.asset(
                        'images/pay.png',
                        height: 20,
                        width: 20,
                      ),
                      trailing: Radio(
                          value: 'PayPal',
                          groupValue: payments,
                          onChanged: (String? value) {
                            setState(() {
                              payments = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                    height: 58,
                    width: 360,
                    decoration: BoxDecoration(
                        color: Color(0x40FFC930),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Text(
                        'Visa',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      leading: Image.asset(
                        'images/master.png',
                        height: 20,
                        width: 20,
                      ),
                      trailing: Radio(
                          value: 'Visa',
                          groupValue: payments,
                          onChanged: (String? value) {
                            setState(() {
                              payments = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 48,
                    width: 360,
                    child: ElevatedButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 223, 224, 224),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
