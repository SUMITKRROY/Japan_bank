import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japan_bank/screen/Customer_Info/Contact%20Info.dart';

class UploadSelfie extends StatefulWidget {
  const UploadSelfie({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadSelfie> createState() => _UploadSelfieState();
}

var checkindex = true;
var _currentindex = 0;

class _UploadSelfieState extends State<UploadSelfie> {
  final GlobalKey<FormState> _key = GlobalKey();

  var isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: height,
                width: width,
                child: ListView(
                  children: [
                    Text("Upload Selfie",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.white70.withOpacity(0.80),
                      child: SizedBox(
                        width: width,
                        child: Column(
                          children: [
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
                                        child: CircleAvatar(
                                          radius: width * 0.25,
                                          backgroundColor: Colors.red.shade800,
                                          child: Image.asset(
                                            'assets/images/Upload Selfie.png',
                                            height: height * 0.14,
                                          ),
                                        )))
                                : GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            right: 20,
                                            left: 20,
                                            bottom: 10),
                                        child: CircleAvatar(
                                            radius: width * 0.25,
                                            backgroundColor: Colors.red,
                                            backgroundImage: FileImage(
                                              _image!,
                                            ))),
                                  ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text("Selfie",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textBaseline: TextBaseline.alphabetic),
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: _image == null
                                    ? MaterialStateProperty.all(Colors.grey)
                                    : MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: () {
                              if (_image != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactInfo()));
                              }
                            },
                            child: const Text("Next",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'inter',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        // backgroundColor: Colors.black38,
        context: context,
        builder: (BuildContext) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(children: [
                const Text('Upload Selfie',
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
                      child: SizedBox(
                        width: 60,
                        child: Wrap(
                          children: [
                            SizedBox(
                                width: 50,
                                child: Icon(Icons.camera_alt_outlined)),
                            const Text('Camera')
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
