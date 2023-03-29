import 'dart:convert';
import 'dart:io';

import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japan_bank/Utils/globle.dart';
import '../Upload Selfie/Upload Selfie.dart';

class CustomerInfo2 extends StatefulWidget {
  const CustomerInfo2({Key? key}) : super(key: key);

  @override
  State<CustomerInfo2> createState() => _CustomerInfo2State();
}

class _CustomerInfo2State extends State<CustomerInfo2> {
  final _formKey = GlobalKey<FormState>();
  bool checkid = true;
  File? _image;
  final imagePicker = ImagePicker();
  var selfiImgBase64 = '';
  final Documents =TextEditingController();
  final kyc =TextEditingController();
  var dob =TextEditingController();

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
      body: Form(
        key: _formKey,
        child:  MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Stack(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ListView(
                    children: [
                      const Text(
                        "Customer Info",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          fontFamily: "inter",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 13,bottom: 13),
                        child: Text(
                          "ID Documents",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                             bottom: 0, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: height * 0.07,
                              width: width * 0.40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    checkid = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  checkid ? Colors.white : Colors.red,
                                  side: const BorderSide(
                                      width: 1, color: Colors.grey),
                                ),
                                child: Text('ID Card',
                                    style: TextStyle(
                                        color: checkid
                                            ? Colors.grey
                                            : Colors.white)),
                              ),
                            ),
// SizedBox(
//   width: width * 0.04,
// ),
                            SizedBox(
                              height: height * 0.07,
                              width: width * 0.40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    checkid = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  checkid ? Colors.red : Colors.white,
                                  side: const BorderSide(
                                      width: 1, color: Colors.grey),
                                ),
                                child: Text(
                                  checkid ? 'Passport' : 'Passport',
                                  style: TextStyle(
                                    color: checkid ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          checkid ? 'Passport Number' : 'ID Card Number',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: Documents,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: const Color(0xffB9B9B9),
                            hintText:
                            checkid ? 'Passport Number' : 'ID Card Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return checkid ? 'Please enter valid passport number.' :'Please enter valid id card number.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "Expire Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: DateFormatField(
                          type: DateFormatType.type4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: const Color(0xffB9B9B9),
                            hintText: 'DD/MM/YYYY',
                          ),
                          onComplete: (date) {
                            setState(() {
                              dob=date as TextEditingController;
                            });
                          },

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "KYC Document Upload",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      Container(
                        width: 358,
                        margin: const EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            _image == null
                                ? GestureDetector(

                                onTap: () {
                                  _showPicker(context);
                                },
                                child: Padding(

                                  padding: const EdgeInsets.only(
                                      top: 20.0,
                                      right: 20,
                                      left: 20,
                                      bottom: 10),

                                  child: Image.asset('assets/images/add.png'),
                                ))
                                : GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: GFAvatar(
                                  size: 160,
                                  backgroundImage: FileImage(
                                    _image!,
                                  ),
                                  shape: GFAvatarShape.standard
                                // )
                                //                               CircleAvatar(
                                //                                   radius: width * 0.25,
                                //                                   backgroundColor: Colors.red,
                                //                                   backgroundImage: FileImage(
                                //                                     _image!,
                                //                                   ))),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              checkid
                                  ? 'Take Picture of Passport'
                                  : 'Take Picture  of ID Card',
                            ),
                          ]),
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
                                  (Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const UploadSelfie())));
                                }
                                pass.Documents = Documents.text;
                                pass.dateofbirth = dob.text;


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
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext Index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(children: [
                const Text(' Upload KYC Document',
                    textScaleFactor: 1.0, textAlign: TextAlign.start),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        width: 60,
                        child: Wrap(
                          children: [
                            SizedBox(
                                width: 50,
                                child: Icon(Icons.camera_alt_outlined)),
                            Text('Camera')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        width: 70,
                        child: Wrap(
                          children: [
                            SizedBox(
                                width: 50,
                                child:
                                    Image.asset('assets/images/gallery.png')),
                            const Text('Gallery')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);

        final bytes = _image?.readAsBytesSync();
        selfiImgBase64 = base64Encode(bytes!);
      });
    }
  }

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
