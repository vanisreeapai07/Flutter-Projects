import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_pro1/authscreen/SignUp.dart';
import 'package:sample_pro1/navigation/bottomnav.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFC930),
        ),
        backgroundColor: Color(0xFFFFC930),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 34, color: Colors.black, fontFamily: 'Montserrat'),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'Login to your account',
              style: TextStyle(
                  fontSize: 16, color: Colors.black, fontFamily: 'Montserrat'),
            )
          ],
        ),
        centerTitle: false,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Enter your email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 48,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 223, 224, 224),
                  hintText: 'abcd@gmail.com',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Enter your password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 48,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
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
              height: 74,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:  Color(0xFFFFC930),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bottombar()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Or Connect with',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 19, 0),
                      child: Image.asset('images/google.png'),
                    ),
                    Text(
                      'Goolge',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
            SizedBox(
              height: 16,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 18, 0),
                      child: Image.asset('images/fb.png'),
                    ),
                    Text(
                      'facebook',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 500,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
