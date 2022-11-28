import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
class Find extends StatefulWidget {
  const Find({Key? key}) : super(key: key);

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  final plyr = AudioPlayer();
  static Random random = Random();
  static int initialNumber = random.nextInt(10);
  int ctr=random.nextInt(15)==initialNumber?random.nextInt(15):random.nextInt(15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reach the number"),backgroundColor: Colors.blueAccent,),
      body: Container(
        width: 500,
        // color: Colors.black45,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/math.jpg"),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.center,
              height: 55,
              width: 300,
              // color: Colors.purple,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("$initialNumber",
                style: TextStyle(fontSize: 25,color: Colors.white,
                ),textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25,),
            Container(
              alignment: Alignment.center,
              height: 55,
              width: 300,
              // color: Colors.purple,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("$ctr",
                style: TextStyle(fontSize: 25,color: Colors.white,
                ),textAlign: TextAlign.center,
              ),
            ),
            // Text("$ctr"),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () {
                  setState(() {
                    ctr++;
                  });
                },
                  child: Icon( //<-- SEE HERE
                      Icons.add,
                      color: Colors.black,
                      size: 40,
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                shape: CircleBorder(), //<-- SEE HERE
                padding: EdgeInsets.all(8),
                ),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                onPressed: () {
                  setState(() {
                    ctr--;
                  });
                },
                  child: Icon( //<-- SEE HERE
                      Icons.remove,
                      color: Colors.black,
                      size: 40,
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                shape: CircleBorder(), //<-- SEE HERE
                padding: EdgeInsets.all(8),
                ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            ctr==initialNumber?Image.asset("assets/cheer.gif"):
           Image.asset("assets/tryagain.gif",height: 300,),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(150, 50)
              ),
                onPressed: (){
              setState(() {
                initialNumber = random.nextInt(10);
                ctr = random.nextInt(15)==initialNumber?random.nextInt(15):random.nextInt(15);
              });
            }, child: Text("Play Again",style: TextStyle(fontSize: 25),))
          ],
        ),
      ),
    );
  }
}
