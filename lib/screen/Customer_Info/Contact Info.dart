// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:japan_bank/Utils/globle.dart';

import '../Account/Account Link.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  get phone => phone;



  @override
  State<ContactInfo> createState() => _ContactInfoState();
}


class _ContactInfoState extends State<ContactInfo> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  TextEditingController _phone= TextEditingController();
  final _whatsapp = TextEditingController();
  final _email = TextEditingController();
  bool? isChecked = true;


  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
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
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 0, right: 25, top: 5),
              child: Container(
                  child: ListView(
                children: [
                  Container(

                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Contact Info",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 13),
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  IntlPhoneField(
                    keyboardType: TextInputType.number,
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Whatsapp Number',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              'Same as Mobile Number',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ),
                          SizedBox( width: 25,
                            child: Checkbox(
                              activeColor: Colors.red,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                              value: isChecked,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  IntlPhoneField(
                    keyboardType: TextInputType.number,
                    controller: _whatsapp,
                    decoration: InputDecoration(
                      hintText: 'whatsapp Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:05,bottom: 13),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Colors.cyan,
                      hintText: 'Enter Email Address',
                      suffixStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if(value!.isEmpty){
                        return ("Email is required");
                      }
                      else if(!regex.hasMatch(value)){
                        return ("Enter valid email address");
                      }
                      return null;
                    },
                    /*validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid email address.';
                      }
                      return null;
                    },*/
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                             if (_formKey.currentState!.validate()) {
                               (Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => AccountLink())));
                             }

                             pass.phone = _phone.text;
                             pass.whatsapp = _whatsapp.text;
                             pass.email =  _email.text;

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
              )),
            ),
          ),
        ));
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }
}
