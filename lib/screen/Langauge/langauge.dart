import 'package:flutter/material.dart';
import 'package:japan_bank/screen/Home/select_user.dart';
import 'package:japan_bank/screen/Onboard/onboard_sc.dart';

class langauge extends StatefulWidget {
  const langauge({Key? key}) : super(key: key);

  @override
  State<langauge> createState() => _langaugeState();
}

class _langaugeState extends State<langauge> {
  bool isSelected = true;
  var Currentindex = 0;

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: ButtonStyle(
                alignment: Alignment.topRight,
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => onboarding()));
              },
              child: const Text(
                'Skip',
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Builder(builder: (context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 10, right: 25, bottom: 00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      'assets/images/langauge.png',
                      alignment: Alignment.topLeft,
                      height: height * 0.1,
                      width: width * 0.2,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(bottom: 8, top: 31),
                      child: Text(
                        'Choose Your Preferred Language',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  const Align(
                    alignment: Alignment.topLeft,
                      child: Text(
                        'Please select your language',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )),
                  SizedBox(
                    height: 05,
                  ),
                  SizedBox(
                    height: height * 0.5,
                    child: ListView.separated(
                      itemCount: contents.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Currentindex = index;
                            });
                          },
                          child: ListTile(
                            leading: SizedBox(
                              width: 45,
                              height: 45,
                              child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(contents[index].image)),
                            ),
                            title: Text(
                              contents[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: "Inter"),
                            ),
                            trailing: Currentindex == index
                                ? Image.asset(
                                    height: 19,
                                    width: 23,
                                    "assets/images/tick.png")
                                : SizedBox(),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => selectuser()));
                          },
                          child: Image.asset(
                            'assets/images/next.png',
                            height: height * 0.06,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class langaugelist {
  String image;
  String title;

  langaugelist({
    required this.title,
    required this.image,
  });
}

List<langaugelist> contents = [
  langaugelist(
    title: 'Laos',
    image: 'assets/images/laos.png',
  ),
  langaugelist(
    title: 'English',
    image: 'assets/images/English.png',
  ),
  langaugelist(
    title: 'Japanese',
    image: 'assets/images/Japanese.png',
  ),
  langaugelist(
    title: 'Chinese',
    image: 'assets/images/Chinese.png',
  ),
];
