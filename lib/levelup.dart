import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);
  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  List<bool> _isDone = [false, false, false];
  List<bool> elementState = [false, false, false];
  double itemsize = 70;
  double newsize = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guess the shape"),backgroundColor: Colors.purple,),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 600,
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/board3.png"))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: itemlist
                          .map((item) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: DragTarget<Itemdata>(
                          onWillAccept: (data) =>
                          data?.name == item.name,
                          onAccept: (e) {
                            setState(() {
                              _isDone[itemlist.indexOf(e)] = true;
                              elementState[itemlist.indexOf(e)] = true;
                            });
                          },
                          builder: (BuildContext context, List incoming,
                              List rejected) {
                            return _isDone[itemlist.indexOf(item)]
                                ? Container(
                              height: newsize,
                              width: newsize,
                              child:
                              SvgPicture.asset(item.address),
                            )
                                : Container(
                              height: itemsize,
                              width: itemsize,
                              child: SvgPicture.asset(
                                item.address,
                                color: Colors.black45,
                              ),
                            );
                          },
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.7),
                      border: Border.all(
                          color: Colors.black54.withOpacity(0.8), width: 3
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Wrap(
                        children: itemlist
                            .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Draggable<Itemdata>(
                            data: e,
                            onDragStarted: () {
                              setState(() {
                                newsize = 60;
                              });
                            },
                            childWhenDragging: Container(
                              height: itemsize,
                              width: itemsize,
                            ),
                            feedback: Container(
                              height: itemsize,
                              width: itemsize,
                              child: SvgPicture.asset(e.address,),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: elementState[itemlist.indexOf(e)]
                                  ? Container(
                                width: itemsize,
                                height: itemsize,
                              )
                                  : Container(
                                height: itemsize,
                                width: itemsize,
                                child:
                                SvgPicture.asset(e.address),
                              ),
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              // Image.asset("assets/shark.png")
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Match the images with the shadows",style: TextStyle(fontSize: 35),maxLines: 5,),
              ),
              Image.asset("assets/try.gif",height: 180,)
            ],
          ),
        ),
      ),
    );
  }
}
class Itemdata {
  final String name;
  final String address;
  Itemdata({required this.name,required this.address});

}

List<Itemdata> itemlist = [
  Itemdata(name: "1", address: "assets/circle.svg"),
  Itemdata(name: "2", address: "assets/star.svg"),
  Itemdata(name: "3", address: "assets/triangle.svg")
];
