import 'package:flutter/material.dart';

import '../Account/Conform Account.dart';

class SecurityCode extends StatefulWidget {
  const SecurityCode({Key? key}) : super(key: key);

  @override
  State<SecurityCode> createState() => _SecurityCodeState();
}

class _SecurityCodeState extends State<SecurityCode> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
        body: Form(
          key: _formKey,
          child:  MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 05, 25, 10),
                child: ListView(
                  children: [
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
                    const Padding(
                      padding: EdgeInsets.only(top: 31, bottom: 13),
                      child: Text(
                        'Security Code',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Colors.cyan,
                        hintText: 'Enter Bank Token',
                        suffixStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid ATM card number.';
                        }
                        return null;
                      },
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
                              if (_formKey.currentState!.validate()) {
                             Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConformAccount()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        )

    );;
  }
}
