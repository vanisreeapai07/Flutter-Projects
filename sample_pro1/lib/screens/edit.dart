import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _textEditingController =
      TextEditingController(text: 'Harry');
  TextEditingController _textEditingController2 =
      TextEditingController(text: 'harrystyles@gmail.com');
  TextEditingController _textEditingController3 =
      TextEditingController(text: '1234');

  @override
  void dispose() {
    _textEditingController.dispose();
    _textEditingController2.dispose();
    _textEditingController3.dispose();
    super.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 235, 198, 95),
        centerTitle: true,
        title: Text(
          'Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              'images/back.png',
              width: 25,
              height: 17,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.only(left: 38,),
                child: Container(
                  // padding: EdgeInsets.only(left: 1),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 198, 95),
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/edit.png',
                        width: 25,
                        height: 17,
                      )),
                ),
              ),
              SizedBox(
                height: 43,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/userEdit.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            // height: 40,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Image.asset(
                      'images/smsEdit.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: TextField(
                          controller: _textEditingController2,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            // height: 40,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: 48,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Image.asset(
                      'images/lockEdit.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                     Expanded(
                        child: TextField(
                          controller: _textEditingController3,
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            // height: 40,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 160),
              Container(
                height: 48,
                width: 360,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 235, 198, 95),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: Text(
                    'Save and Update',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Edit()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Edit(),
  ));
}
