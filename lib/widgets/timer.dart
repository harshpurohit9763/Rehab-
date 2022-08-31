import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  var sessionData;

  Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.1,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.sessionData()["perform"];
                });
              },
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.blue,
              )),
          SizedBox(
            width: 10,
          ),
          Container(
            width: width * 0.2,
            height: height * 0.05,
            child: Center(child: Text('Complete')),
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
