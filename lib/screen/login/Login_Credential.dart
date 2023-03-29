
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:japan_bank/Utils/globle.dart';
import 'package:japan_bank/screen/Customer_Info/Customer_Info.dart';

class LoginCredential extends StatefulWidget {
  const LoginCredential({Key? key}) : super(key: key);

  @override
  State<LoginCredential> createState() => _LoginCredentialState();
}

class _LoginCredentialState extends State<LoginCredential> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username= TextEditingController();
  TextEditingController _pass= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25, top: 08),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 08),
                    child: Image.asset(
                      'assets/images/img.png',
                      height: height * 0.20,
                      width: width * 0.20,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Login Credential',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Create User Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                    top: 13),
                    child: TextFormField(
                      controller: username,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      autocorrect: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Container(

                                // color: Colors.cyan,
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/images/img_4.png")),
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  )),
                            )
                          ],
                        ),
                        fillColor: Colors.cyan,
                        hintText: 'Enter User Name',
                        suffixStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter user name';
                        }
                        else if(value.length<3){
                          return ("user must be more than 2 characters");
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                     /* inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'["^[A-Za-z][A-Za-z0-9_]{7,29}$"]')),
                      ],*/
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only( top: 20),
                    child: Text(
                      'Create Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                       top: 5),
                    child: TextFormField(
                      controller: _pass,
                      obscureText: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 13),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    // color: Colors.cyan,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/img_3.png')),
                                  ),
                                  // color: Colors.cyan,
                                  height: 40,
                                  width: 40,
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  )),
                            )
                          ],
                        ),
                        fillColor: Colors.redAccent,
                        hintText: 'Enter Password',
                        suffixStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if(value!.isEmpty){
                          return ("Password is required");
                        }
                        else if(value.length<8){
                          return ("Password must be more than 7 characters");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("Password should contain upper,lower,digit and special character ");
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only( top: 20),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                         top: 5),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    // color: Colors.cyan,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/img_3.png')),
                                  ),
                                  // color: Colors.cyan,
                                  height: 40,
                                  width: 40,
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  )),
                            )
                          ],
                        ),
                        fillColor: Colors.redAccent,
                        hintText: 'Re-enter Password',
                        suffixStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter conform password';
                        }
                        if(value!=_pass.text){
                          return ("Password must be same");
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomerInfo()));
                            }
                            pass.Username= username.text;
                            pass.Firstname;

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
