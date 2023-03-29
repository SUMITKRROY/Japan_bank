import 'package:flutter/material.dart';

import '../Tpin/T pin.dart';

class ConformAccount extends StatefulWidget {
  const ConformAccount({Key? key}) : super(key: key);

  @override
  State<ConformAccount> createState() => _ConformAccountState();
}


class _ConformAccountState extends State<ConformAccount> {
  bool? isChecked = false;
  bool? isChecked1 = false;
  bool? isChecked2 = false;


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
      body:   MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 20, 20),
        child: ListView(
          children: [
            Text(''),
            Container(
                child: const Text(
                  'Confirm Account List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: "inter",
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                  child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked!;
                        });
                      }),
                ),

                SizedBox(height: height * 0.2,
                    width: width * 0.7,child: Image.asset('assets/images/SAVING ACCOUNT1.png',)),
                Icon(Icons.delete)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(      width: 10,
                  child: Checkbox(
                      value: isChecked2,
                      onChanged: (value) {
                        setState(() {
                          isChecked2 = !isChecked2!;
                        });
                      }),
                ),

                SizedBox(height: height * 0.2,
                    width: width * 0.7,child: Image.asset('assets/images/SAVING ACCOUNT2.png',)),
                Icon(Icons.delete)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(       width: 10,
                  child: Checkbox(
                      value: isChecked1,
                      onChanged: (value) {
                        setState(() {
                          isChecked1 = !isChecked1!;
                        });
                      }),
                ),

                SizedBox(height: height * 0.2,
                    width: width * 0.7,child: Image.asset('assets/images/SAVING ACCOUNT2.png',)),
                Icon(Icons.delete)
              ],
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
                                  builder: (context) => const Tpin())));
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
    );
  }
}
