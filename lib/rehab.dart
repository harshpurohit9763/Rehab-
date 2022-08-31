import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehab/utils/text.dart';

import 'HomeScreen.dart';

class Rehab extends StatefulWidget {
  Rehab({super.key});

  final ref = fb.ref().child('sessions/IsCompleted');

  @override
  State<Rehab> createState() => _RehabState();
}

class _RehabState extends State<Rehab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const Text(
              "Rehab Program",
              style: headText1,
            ),
            Container(
              decoration: decoration3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Knee Rehab Programme',
                              style: headText5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Mon,Tue,Sat '),
                            const Text('3 Sessions/day '),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width * 0.3,
                              height: height * 0.05,
                              decoration: decoration2,
                              child: const Center(
                                child: const Text(
                                  'Left Sholder',
                                  style: headText4,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Assigned By", style: headText5),
                            const Text("Harsh Purohit", style: subText),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/12.svg",
                      height: height * 0.21,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'History',
                  style: headText2,
                ),
                Icon(
                  Icons.filter_alt_rounded,
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: height * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Total Sessions'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          ' 16',
                          style: headText2,
                        ),
                      ],
                    ),
                    const Text('|'),
                    Column(
                      children: [
                        const Text('Total Time'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '17s',
                          style: headText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
