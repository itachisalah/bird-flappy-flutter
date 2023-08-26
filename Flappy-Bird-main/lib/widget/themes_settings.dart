


import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Database/functions.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flutter/material.dart';

class ThemeSettings extends StatefulWidget{
  const ThemeSettings ({Key? key}): super (key:key);

  @override
  State<ThemeSettings> createState() =>_ThemeSettingsState();


}

class _ThemeSettingsState extends State<ThemeSettings>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Themes",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Magic4"
                ),),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: (){
                setState(() {
                  Str.image= "0";
                  write("background", Str.image);
                  background(Str.image);
                });
              },child: Image.asset(
                "assets/pics/0.png",
                width: 73,
                height: 70,
              ),
              ),
              GestureDetector(onTap: (){
                setState(() {
                  Str.image= "1";
                  write("background", Str.image);
                  background(Str.image);
                });
                },child: Image.asset(
                  "assets/pics/1.png",
                  width: 73,
                  height: 70,
                ),
              ),
              GestureDetector(onTap: (){
                setState(() {
                  Str.image= "2";
                  write("background", Str.image);
                  background(Str.image);
                });
              },child: Image.asset(
                "assets/pics/2.png",
                width: 63,
                height: 66,
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}