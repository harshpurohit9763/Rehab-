import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehab/utils/text.dart';
import 'package:rehab/widgets/timer.dart';

class SessionWidget extends StatefulWidget {
  final fb = FirebaseDatabase.instance;
  var sessionData;
  SessionWidget({required this.sessionData});

  @override
  State<SessionWidget> createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 8.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.transparent,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 12),
                    child: Center(
                        child: Text(
                      widget.sessionData["sessionName"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Container(
                    width: 100,
                    height: 25,
                    child: Center(
                        child: Text(
                      widget.sessionData["isCompleted"]
                          ? 'Completed'
                          : 'performed',
                      style: subText,
                    )),
                    decoration: BoxDecoration(
                      color: widget.sessionData["isCompleted"]
                          ? Colors.blue[400]
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
                  widget.sessionData["isCompleted"]
                      ? Container(
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text("Performed At:"),
                            Text(widget.sessionData["performedAt"]),
                          ]),
                        )
                      : Timer()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/8.svg",
                      height: height * 0.15,
                      width: width * 0.05,
                    ),
                  ),
                ],
              ),
            )
            // Column(
            //   children: [Image.asset(listImagesnotFound.toString(),fit: yes,)],
          ],
        ),
      ),
    );
  }
}
