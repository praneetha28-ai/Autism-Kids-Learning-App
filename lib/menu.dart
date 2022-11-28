import 'package:flutter/material.dart';
import 'package:klip/colors.dart';
import 'package:klip/count.dart';
import 'package:klip/matching.dart';
import 'find.dart';
import 'daily.dart';
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 600,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill
          )
        ),
        // color: Colors.red,
         child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome Kiddoo !!!",style: TextStyle(fontSize: 25,color: Colors.white),),
              Image.asset(
                "assets/hi.gif",
                height: 150,
                width: 150,
              ),
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
                child: Text("Play Games and Have Fun",
                  style: TextStyle(fontSize: 25,color: Colors.white,
                    ),textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    backgroundColor: Colors.purple,
                ),
                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Matching()))
                  },
                  child: Text("Matching",style: TextStyle(fontSize: 22),)
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50),
                  backgroundColor: Colors.pink),
                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ColorsMatch()))
                  },
                  child: Text("Colors",style: TextStyle(fontSize: 22),)
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50),
                  backgroundColor: Colors.yellowAccent),
                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DragImage()))
                  },
                  child: Text("Guess the shape",
                    style: TextStyle(color: Colors.black,fontSize: 22),)
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Find()))
                  },
                  child: Text("Reach the count",
                    style: TextStyle(fontSize:22 ),)
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50),
                  backgroundColor: Colors.red),
                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Daily()))
                  },
                  child: Text("Daily Routine",
                    style: TextStyle(fontSize: 22),
                  )
              ),
            ],
          )
      ),
    );
  }
}