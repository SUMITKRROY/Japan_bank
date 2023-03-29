import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:japan_bank/Utils/globle.dart';
import 'package:japan_bank/screen/Customer_Info/Customer%20Info2.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final _formKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final gender = TextEditingController();
  final _Nationality = TextEditingController();

  bool checkid = false;



  DateTime? _date;

  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Scaffold(
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
              padding: const EdgeInsets.fromLTRB(25, 8, 26, 0),
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
                    padding: EdgeInsets.only(top: 31),
                    child: Text(
                      "First Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: TextFormField(
                      maxLength: 20,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: firstname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color(0xffB9B9B9),
                        hintText: 'Enter First Name',
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^[a-z A-Z]+$');
                        if(value!.isEmpty){
                          return ("Enter your first name");
                        }
                        else if(value.length<3){
                          return ("Name must be more than 2 characters");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("Name should not contain digit and special character ");
                        }
                        return null;
                      },
                    /*  validator: (value) => value!.isEmpty
                          ? 'Enter Your Name'
                          :RegExp regex= RegExp('!@#<>?":_``~;[]\|=-+)(*&^%1234567890')
                          ? 'Enter a Valid Name'
                          : null,*/
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 05),
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: TextFormField(
                      maxLength: 20,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: lastname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color(0xffB9B9B9),
                        hintText: 'Enter Last Name',
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^[a-z A-Z]+$');
                        if(value!.isEmpty){
                          return ("Enter your first name");
                        }
                        else if(value.length<3){
                          return ("Name must be more than 2 characters");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("Name should not contain digit and special character ");
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 13 ,bottom: 13),
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Row(
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
                            side:
                            const BorderSide(width: 1, color: Colors.grey),
                          ),
                          child: Text(checkid ? 'Male' : 'Male',
                              style: TextStyle(
                                  color: checkid ? Colors.grey : Colors.white)),
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
                            side:
                                const BorderSide(width: 1, color: Colors.grey),
                          ),
                          child: Text(
                            'Female',
                            style: TextStyle(
                              color: checkid ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Date Of Birth",
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: const Color(0xff000000),
                        hintText: 'DD/MM/YYYY',
                      ),
                      onComplete: (date) {
                        setState(() {
                          _date = date;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Nationality",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  /*  Container(
                    margin: const EdgeInsets.fromLTRB(25, 13, 26, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),

                    ),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: TextField(
                      showCursor: false,
                      controller: _Nationality,
                      decoration: InputDecoration(
                        /*contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15),*/
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        prefixIcon: TextButton(
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              onSelect: (value) {
                                setState(
                                  () {
                                    _selectedCountry = value;
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                            "${_selectedCountry?.flagEmoji}  ${_selectedCountry?.displayNameNoCountryCode}",
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            showCountryPicker(
                              context: context,
                              onSelect: (value) {
                                setState(
                                      () {
                                    _selectedCountry = value;
                                  },
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

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
                                      builder: (context) => const CustomerInfo2()));
                            }
                            pass.Firstname = firstname.text;
                            pass.lastname = lastname.text;
                            pass.dateofbirth = _date.toString();
                            pass.Nationality = _Nationality.text;
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
          ),
        ));
  }
}
