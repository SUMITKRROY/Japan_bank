import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Home/Summary Details.dart';

class Tpin extends StatefulWidget {
  const Tpin({Key? key}) : super(key: key);

  @override
  State<Tpin> createState() => _TpinState();
}

class _TpinState extends State<Tpin> {
  final _formKey = GlobalKey<FormState>();
  final _tpincode = TextEditingController();
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
        body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 20),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: 391,
                      height: 300,
                      child: Image.asset(
                        'assets/images/Create New TPIN.png',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Create New TPIN",
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
                      controller: _tpincode,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        RegExp regex=RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
                        if(value!.isEmpty){
                          return ("TPIN is required");
                        }
                        else if(value.length<6){
                          return ("TPIN must be more than 5 characters");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("TPIN should contain digit");
                        }
                        return null;
                      },
                      /*validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter TPIN to proceed.';
                        }
                        return null;
                      },*/
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 13),
                      child: Text(
                        'Confirm TPIN',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Colors.cyan,
                        hintText: 'Re-enter TPIN',
                        suffixStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'TPIN and Confirm TPIN does not match.';
                        }
                        if(value!=_tpincode.text){
                          return ("TPIN must be same");
                        }
                        return null;
                      },
                    /*  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },*/
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
                                (Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SummaryDetails())));
                              }

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
                  ],
                ),
              ),
            )));
  }
}
