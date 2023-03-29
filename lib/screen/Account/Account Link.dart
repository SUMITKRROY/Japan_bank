import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Tpin/Alternative Option.dart';
import '../Tpin/T pin.dart';
import 'Conform Account.dart';

class AccountLink extends StatefulWidget {
  const AccountLink({Key? key}) : super(key: key);

  @override
  State<AccountLink> createState() => _AccountLinkState();
}

class _AccountLinkState extends State<AccountLink> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: width,
                    height: height*0.45,
                    child: Image.asset(
                      'assets/images/Account Link.png',
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Account Link",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Text(
                      'Input Code',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Colors.cyan,
                      hintText: 'Enter Code',
                      suffixStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                           (Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConformAccount())));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21,bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          (Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlternativeOption())));
                        },
                        child: Text("Alternate option to generate code",
                        style: TextStyle(color: Color(0xffE41D29),fontSize: 16,fontWeight: FontWeight.w600 )),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
