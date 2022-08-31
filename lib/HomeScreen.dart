import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rehab/rehab.dart';
import 'package:rehab/utils/text.dart';
import 'package:rehab/widgets/sessions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var time = DateTime.now();
final fb = FirebaseDatabase.instance;
final ref = fb.ref().child('sessions/');
Stream<DatabaseEvent> stream = ref.onValue;

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void navigationBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Random r = new Random();

  AddSession(var sessionData) {
    ref.push().set(sessionData).asStream();
  }

  String time = TimeOfDay.now().toString();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good morning',
                        style: headText1,
                      ),
                      const Text(
                        'jane',
                        style: headText1,
                      ),
                      Container(
                        height: height * 0.2,
                        margin: EdgeInsets.all(5),
                        child: Card(
                          elevation: 5,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Todays Progress',
                                      style: headText2,
                                    ),
                                    Text(
                                      ' 50 %',
                                      style: headText2,
                                    ),
                                  ],
                                ),
                              ),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 78,
                                animation: true,
                                lineHeight: 10,
                                percent: 0.5,
                                barRadius: const Radius.circular(16),
                                backgroundColor: Colors.grey[300],
                                progressColor: Colors.blue,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Completed'),
                                        Text('No of Sessions'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text('Completed'),
                                        Text('No of Sessions'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FirebaseAnimatedList(
                  query: ref,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, snapshot, animation, index) {
                    final data = snapshot.value as Map<dynamic, dynamic>;
                    return SessionWidget(
                      sessionData: data,
                    );
                  })
            ]),
          ),
          GestureDetector(
            onTap: () {
              counter++;
              AddSession({
                "sessionName": "Session $counter",
                "isCompleted": r.nextBool(),
                "performedAt": TimeOfDay.now().toString(),
              });
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: decoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Start Session',
                    style: normalText,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
