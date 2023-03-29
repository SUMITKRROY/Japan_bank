// ignore_for_file: camel_case_types


import 'package:flutter/material.dart';
import 'package:japan_bank/screen/Account/Account_type.dart';

import '../login/LoginPage.dart';

class selectuser extends StatefulWidget {
  const selectuser({super.key});

  @override
  State<selectuser> createState() => _selectuserState();
}

class _selectuserState extends State<selectuser> {
  bool checkid = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 40, 20, 0),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/img.png",
                height: height * 0.20,
                width: width * 0.20,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: const Text(
                    'Hello There!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontFamily: "inter",
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 08),
                  child: const Text(
                    'Choose Option to Continue...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: "inter",
                    ),
                  )),
              Container(
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(
                    width: 1,
                    color: Colors.red,
                  ),
                  color: Colors.red,
                ),
                margin: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkid = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkid ? Colors.white : Colors.red,
                    ),
                    child: Text(
                      "I am an existing user",
                      style: TextStyle(
                        fontSize: 18,
                        color: checkid ? Colors.black : Colors.white,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
              Container(
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(width: 1, color: Colors.red),
                ),
                margin: EdgeInsets.only(top: 33),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkid = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const accountype()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkid ? Colors.red : Colors.white,
                    ),
                    child: Text(
                      "I am a new user",
                      style: TextStyle(
                        fontSize: 18,
                        color: checkid ? Colors.white : Colors.black,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
