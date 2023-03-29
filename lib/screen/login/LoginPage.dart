// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japan_bank/screen/Account/Account_type.dart';
import 'package:local_auth/local_auth.dart';
import 'Login_Credential.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _chooseUserState();
}

class _chooseUserState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _pass = TextEditingController();
  bool? isChecked = false;
  var isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';





  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Scaffold(
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 08),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, bottom: 0, right: 0, top: 20),
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
                    'Welcome',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Enter detail to continue',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Container(

                                  // color: Colors.cyan,
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/images/img_4.png")),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
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
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter user name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
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
                              padding: EdgeInsets.symmetric(vertical: 10.0),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
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
                            InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Remember Me",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            )),
                      ],
                    ),

                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 25, bottom: 0, right: 25, top: 13),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const accountype()));
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),
                        ),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                      /*    onTap: () async {
                            bool isAuthenticated = await authenticate();

                            if (isAuthenticated) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginCredential();
                                  },
                                ),
                              );
                            } else {
                              Container();
                            }
                          },*/
                          child: const Icon(
                            Icons.fingerprint,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            width: 50,
                            height: 50,
                            "assets/images/Vector.png",
                            color: const Color(0xffE41D29),
                          ),
                        )
                      ],
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
                        child: /*ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                        }
                      },
                      child: const Text('Submit'),
                    ),*/
                            ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const accountype()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text('Submit'),
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

class Onboarding {
  String image;
  bool? isChecked = false;

  Onboarding({
    required this.image,
    required this.isChecked,
  });
}
