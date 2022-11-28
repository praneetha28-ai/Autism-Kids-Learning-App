import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  List<String> images = [
    "assets/wakeup.jpg",
    "assets/brush.jpg",
    "assets/shower.jpg",
    "assets/dressed.jpg",
    "assets/eat.jpg",
    "assets/school.jpg",
    "assets/play.png",
    "assets/dinner.jfif",
    "assets/sleep.jfif"
   ];List<String> imagesdup = [
    "assets/wakeup.jpg",
    "assets/brush.jpg",
    "assets/shower.jpg",
    "assets/dressed.jpg",
    "assets/eat.jpg",
    "assets/school.jpg",
    "assets/play.png",
    "assets/dinner.jfif",
    "assets/sleep.jfif"
   ];
  List<String> captions = [
    "Wake Up ",
    "Brush your teeth",
    "Take a shower",
    "Dress up",
    "Have your breakfast",
    "Go to school",
    "Play with friends",
    "Have your dinner",
    "Take a good sleep"
  ];List<String> capd = [
    "Wake Up ",
    "Brush your teeth",
    "Take a shower",
    "Dress up",
    "Have your breakfast",
    "Go to school",
    "Play with friends",
    "Have your dinner",
    "Take a good sleep"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily activities"),),
      body: Center(
        child: ListView.builder(
          itemCount: images.length+1,
          itemBuilder: (BuildContext context,int index){
            if (index==images.length) {
              return Text("See you tomorrow");
            }else{
              final img = images[index];
              final cap = captions[index];

              return Dismissible(
                  key: Key(img),
                  background: Container(color: Colors.red,),
                  // margin: EdgeInsets.only(left: 6,right: 6),
                  onDismissed: (direction){
                    setState(() {
                      images.removeAt(index);
                      captions.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Image.asset(img),
                    subtitle: Text(cap,style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),textAlign: TextAlign.center,),
                  )
              );
            }
          },
        ),
      ),
 //      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
 //      floatingActionButton: FloatingActionButton(onPressed: () { setState(() {
 //   images.addAll(imagesdup);captions.addAll(capd);
 // });
 // },
 //        child: ElevatedButton(
 //          onPressed: (){}, child: Text("Start a new day"),
 //        ),
 //
 //      ),
    );
  }
}