import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ColorsMatch extends StatefulWidget {
  const ColorsMatch({Key? key}) : super(key: key);

  @override
  State<ColorsMatch> createState() => _ColorsState();
}

class _ColorsState extends State<ColorsMatch> {
  final plyr = AudioPlayer();
  var r1c1 = Colors.deepPurple;
  var r1c2 = Colors.blueGrey;
  var r1c3 = Colors.cyan;
  var r2 = Colors.yellow;
  var r3c1 = Colors.green;
  var r3c2 = Colors.red;
  var r3c3 = Colors.blue;
  var selectedColor = Colors.blue;
  var play = false;
  var win = false;

  var msg = "";
  var colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.blueGrey,
    Colors.cyan,
    Colors.deepPurple,
    Colors.yellow
  ];
  final _random = new Random();
  var noOfColors = 7;
  var myTimer = 90;

  startCountdown() {
    play = true;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        myTimer = myTimer - 1;
        if (r1c1 == selectedColor &&
            r1c2 == selectedColor &&
            r1c3 == selectedColor &&
            r2 == selectedColor &&
            r3c1 == selectedColor &&
            r3c2 == selectedColor &&
            r3c3 == selectedColor) {
          timer.cancel();
          play = false;
          win = true;
          resetColors();
          alertBox(win);
        }
        if (myTimer < 0) {
          play = false;
          timer.cancel();
          win = false;
          resetColors();
          alertBox(win);
        }
      });
    });
  }

  resetColors() {
    r1c1 = Colors.deepPurple;
    r1c2 = Colors.blueGrey;
    r1c3 = Colors.cyan;
    r2 = Colors.green;
    r3c1 = Colors.yellow;
    r3c2 = Colors.red;
    r3c3 = Colors.blue;
    myTimer = 90;
    selectedColor = colorList[_random.nextInt(noOfColors)];
  }

  void alertBox(win) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        if (win) {
          return AlertDialog(
            title: Text("Congrats !"),
            content: Text("You Won !!"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
        return AlertDialog(
          title: Text("Time Up !"),
          content: Text("Better Luck next time"),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Fill the color"),backgroundColor: Colors.pink,),
      body: Container(
          child: Column(
            children: [
              Text("Change all the colors of the blocks to the given color in 90seconds.",
              style: TextStyle(fontSize: 25,color: Colors.purple,fontWeight: FontWeight.w500),),
              gameOptions(),
              row1(),
              row2(),
              row3(),
            ],
          )),
    );
  }

  Padding gameOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text("Time Left: $myTimer",style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          GestureDetector(
            onTap: () {
              if (!play) {
                startCountdown();
                // plyr.play(AssetSource("match.wav"));
              }
            },
            child: Container(
              decoration:
              BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.green,
              ),
              height: 40.0,
              width: 40.0,
            ),
          ),
          Container(
            decoration:
            BoxDecoration(color: selectedColor, shape: BoxShape.rectangle),
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }

  Row row3() {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r1c1 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r1c1, height: 100))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r1c2 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r1c2, height: 100))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r1c3 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r1c3, height: 100))),
    ]);
  }

  Expanded row2() {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              if (play) {
                setState(() {
                  r2 = colorList[_random.nextInt(noOfColors)];
                });
              }
            },
            child: Container(
              color: r2,
            )));
  }

  Row row1() {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r3c1 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r3c1, height: 100))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r3c2 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r3c2, height: 100))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (play) {
                  setState(() {
                    r3c3 = colorList[_random.nextInt(noOfColors)];
                  });
                }
              },
              child: Container(color: r3c3, height: 100))),
    ]);
  }
}
