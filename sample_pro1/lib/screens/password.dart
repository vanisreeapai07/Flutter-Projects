import 'package:flutter/material.dart';
import 'package:sample_pro1/screens/ChatDetailScreen.dart';

class passwordScreen extends StatefulWidget {
  const passwordScreen({super.key});

  @override
  State<passwordScreen> createState() => _passwordScreenState();
}

class _passwordScreenState extends State<passwordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 600,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFFFC930),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Text(
                'Enter password',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: 345,
              height: 47,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 223, 224, 224),
                  hintText: 'password',
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 345,
              height: 47,
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
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatDetails()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
