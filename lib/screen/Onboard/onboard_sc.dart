import 'dart:async';
import 'package:flutter/material.dart';
import 'package:japan_bank/screen/Langauge/langauge.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  @override
  State<onboarding> createState() => _onboardingState();
}

int currentIndex = 0;
late PageController _controller;

int _currentPage = 0;
late Timer _timer;
PageController _pageController = PageController(
  initialPage: 0,
);

class _onboardingState extends State<onboarding> {
  int state = 1;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 8,
                      ),
                      SizedBox(
                        child: Image.asset(
                          width: width / 1.5,
                          height: height / 3,
                          contents[i].image,
                        ),
                      ),
                      SizedBox(
                        height: height / 25,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(width / 15, 10, width / 15, 0),
                        child: Container(
                          height: 260,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                contents[i].title,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: height / 30,
                              ),
                              Text(
                                textScaleFactor: 1.0,
                                contents[i].discription,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'inter',
                                    color: Color(0xff5A5A5A)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 59.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => langauge()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              child: currentIndex == 2
                                  ? const Text(
                                      'Done',
                                      textScaleFactor: 1.0,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    )
                                  : const Text(
                                      'Skip',
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, height / 4),
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _controller,
                count: contents.length,
                effect: const SlideEffect(
                  activeDotColor: Colors.red,
                  dotWidth: 12,
                  dotHeight: 12,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
          currentIndex == 0
              ? const SizedBox()
              : Positioned(
                  left: 0,
                  bottom: 20,
                  child: Container(
                    alignment: Alignment(1.05, 1),
                    child: InkWell(
                        onTap: () {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 30),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/left.png',
                              height: height * 0.25,
                            )
                          ],
                        )),
                  )),
          Positioned(
            right: 0,
            bottom: 20,
            child: Container(
              alignment: Alignment(1.05, 1),
              child: InkWell(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(
                        milliseconds: 30,
                      ),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Image.asset(
                    'assets/images/right.png',
                    height: height * 0.25,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class Onboarding {
  String image;
  String title;
  String discription;
  bool check;
  String description2;

  Onboarding(
      {required this.image,
      required this.title,
      required this.discription,
      required this.check,
      required this.description2});
}

List<Onboarding> contents = [
  Onboarding(
      title: "Convenient",
      image: "assets/images/onboard1.png",
      discription:
          "Open Bank Account, Check Balance, Transfer Funds, Apply for Debit and\n Credit Cards.",
      check: true,
      description2: ' '),
  Onboarding(
      title: "Scan & Pay",
      image: "assets/images/onboard2.png",
      discription:
          "Use MARUHAN App When you Shop,\n Dine and Make QR Payment, It's Easy,\n Fast and Secure.",
      check: false,
      description2: ''),
  Onboarding(
      title: "Do More",
      image: "assets/images/onboard3.png",
      discription:
          "Perform Mobile Top Up, Pay Bills,\n Withdraw Cash without Card with\n Cash by Code.",
      check: false,
      description2: ''),
];
