
import 'package:flutter/material.dart';
import 'package:japan_bank/screen/login/Login_Credential.dart';

import '../Customer_Info/Contact Info.dart';
import '../Customer_Info/Customer_Info.dart';
import 'Conform Account.dart';

class accountype extends StatefulWidget {
  const accountype({Key? key}) : super(key: key);

  @override
  State<accountype> createState() => _accountypeState();
}

class _accountypeState extends State<accountype> {
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
              Container(
                child: Image.asset(
                  "assets/images/img.png",
                  height: height * 0.20,
                  width: width * 0.20,
                ),
              ),
              Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 33),
                child: const Text(
                  'Account Type',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: "inter",
                  ),
                ),
              ),
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

                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkid = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginCredential()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkid ? Colors.white : Colors.red,
                    ),
                    child: Text(
                      "Mobile Banking",
                      style: TextStyle(
                        fontSize: 24,
                        color: checkid ? Colors.black : Colors.white,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 33),
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(width: 1, color: Colors.red),
                ),


                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkid = true;
                      });
                   /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactInfo()));*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkid ? Colors.red : Colors.white,
                    ),
                    child: Text(
                      "Wallet",
                      style: TextStyle(
                        fontSize: 24,
                        color: checkid ? Colors.white : Colors.black,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w500,
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
