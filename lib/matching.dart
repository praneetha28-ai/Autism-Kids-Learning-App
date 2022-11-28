import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class Matching extends StatefulWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  late List<ItemModel> items;
  late List<ItemModel>items2;

  late int score;
  late bool gameOver;

  final plyr = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(icon: Icons.coffee, name: "Coffee", value: "Coffee"),
      ItemModel(icon: Icons.add_a_photo, name: "Camera", value: "Camera"),
      ItemModel(icon: Icons.man, name: "Man", value: "Man"),
      ItemModel(icon: Icons.cake, name: "Cake", value: "Cake"),
      ItemModel(icon: Icons.train, name: "Train", value: "Train"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
    Widget build(BuildContext context) {
      if (items.length == 0)
        gameOver = true;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('Matching Game'),
        ),
        body: Container(
          // child: SingleChildScrollView(
          //   padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/matchbg.jpg"),
              fit: BoxFit.fill
            ),

          ),
            child: Padding(
              padding: const EdgeInsets.all(65.0),
              child: Column(
                children: <Widget>[
                  Text.rich(
                      TextSpan(
                      children: [
                        TextSpan(text: "Score: ",style: TextStyle(fontSize: 25)),
                        TextSpan(text: "$score", style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ))
                      ]
                  )
                  ),
                  SizedBox(height: 45,),
                  if(!gameOver)
                    Row(
                      children: <Widget>[
                        Column(
                            children: items.map((item) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Draggable<ItemModel>(
                                  data: item,
                                  childWhenDragging: Icon(
                                    item.icon, color: Colors.grey, size: 50.0,),
                                  feedback: Icon(
                                    item.icon, color: Colors.teal, size: 50,),
                                  child: Icon(
                                    item.icon, color: Colors.teal, size: 50,),
                                ),
                              );
                            }).toList()
                        ),
                        Spacer(),
                        Column(
                            children: items2.map((item) {
                              return DragTarget<ItemModel>(
                                onAccept: (receivedItem) {
                                  if (item.value == receivedItem.value) {
                                    plyr.play(AssetSource("bonus.wav"));
                                    setState(() {
                                      items.remove(receivedItem);
                                      items2.remove(item);
                                      score += 10;
                                      item.accepting = false;
                                    });
                                  } else {
                                    setState(() {
                                      score -= 5;
                                      item.accepting = false;
                                    });
                                    plyr.play(AssetSource("wrong.wav"));
                                  }
                                },
                                onLeave: (receivedItem) {
                                  setState(() {
                                    item.accepting = false;
                                  });
                                },
                                onWillAccept: (receivedItem) {
                                  setState(() {
                                    item.accepting = true;
                                  });
                                  return true;
                                },
                                builder: (context, acceptedItems, rejectedItem) =>
                                    Container(
                                      color: item.accepting ? Colors.red : Colors
                                          .teal,
                                      height: 50,
                                      width: 100,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Text(item.name, style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),),
                                    ),
                              );
                            }).toList()

                        ),
                      ],
                    ),

                  if(gameOver)
                    Text("GameOver", style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),),

                  SizedBox(height: 50,),
                  if(gameOver)
                    Center(
                      child: ElevatedButton(
                        style: (
                          ElevatedButton.styleFrom(
                            minimumSize: Size(150,50),
                              // backgroundColor: Colors.white,
                            backgroundColor: Colors.purple,
                              textStyle: TextStyle(color: Colors.pink)
                          )
                        ),
                        child: Text("Play Again",style: TextStyle(fontSize: 25),),
                        onPressed: () {
                          initGame();
                          setState(() {

                          });
                        },
                      ),
                    ),
                  if(gameOver)
                    Image.asset("assets/great.gif")
                ],
              ),
            ),
          ),

      );
    }
  }

  class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;
  ItemModel({required this.name, required this.value,required this.icon, this.accepting= false});
}