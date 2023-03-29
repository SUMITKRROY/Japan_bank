import 'dart:async';



import 'package:flutter/material.dart';
import 'package:japan_bank/screen/Onboard/onboard_sc.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 05),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => onboarding()
          ));
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: (Image.asset(
                'assets/images/img.png',
                height: 319,
                width: 319,
              )),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: (Image.asset(
                'assets/images/img_1.png',
              )),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: (Image.asset('assets/images/img_2.png')),
            ),

          ],
        ),
      ),
    );
  }
}
