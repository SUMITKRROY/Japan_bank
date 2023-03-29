import 'package:flutter/material.dart';

import 'ATM Card + Pin.dart';

class AlternativeOption extends StatefulWidget {
  const AlternativeOption({Key? key}) : super(key: key);

  @override
  State<AlternativeOption> createState() => _AlternativeOptionState();
}

class _AlternativeOptionState extends State<AlternativeOption> {
  bool checkid=false;

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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 05, 25, 10),
            child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Alternative Option",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: "inter",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31, bottom: 13),
              child: Text(
                'Choose any one of the option',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: Colors.red,
                ),
                color: Colors.red,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkid = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ATM()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: checkid ? Colors.white : Colors.red,
                  ),
                  child: Text(
                    "ATM Card + Pin",
                    style: TextStyle(
                      fontSize: 14,
                      color: checkid ? Colors.grey : Colors.white,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(width: 01, color: Colors.red),
                ),

                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkid = true;
                      });
                   /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConformAccount()));*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkid ? Colors.red : Colors.white,
                    ),
                    child: Text(
                      "Call Center",
                      style: TextStyle(
                        fontSize: 14,
                        color: checkid ? Colors.white : Colors.grey,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                  /* (Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ATM())));*/
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
            ),*/
          ],
            ),
          )),
    );
  }
}
