import 'package:flutter/material.dart';
import 'package:sample_pro1/models/onBoardingData.dart';
import 'package:sample_pro1/authscreen/SignUp.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer rectIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 5,
      width: 40,
      decoration: BoxDecoration(
          color: currentPage == index ? Color(0xFFFFC930) : Color(0x40FFC930),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(2), right: Radius.circular(2))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFC930),
                Color.fromARGB(255, 235, 198, 95),
                Colors.white70,
                Color(0XFFffffff),
              ]),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      child: Image.asset(onBoardingContents[index].image),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Text(
                        onBoardingContents[index].title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Text(
                        onBoardingContents[index].description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    currentPage == onBoardingContents.length - 1
                        ? TextButton(
                            onPressed: () {
                                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFFFC930),
                                ),
                                width: double.infinity,
                                child: Text(
                                  'Start Messaging',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                )),
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: List.generate(
                                      onBoardingContents.length - 1,
                                      (index) => rectIndicator(index)),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          56, 14, 56, 14),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFFC930),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )))
                            ],
                          ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
