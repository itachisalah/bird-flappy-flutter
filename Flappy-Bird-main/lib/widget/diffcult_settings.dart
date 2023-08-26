


import 'package:flappy_bird/Database/constant.dart';
import 'package:flappy_bird/Database/functions.dart';
import 'package:flutter/material.dart';

import '../Database/database.dart';

class DifficultySettings extends StatelessWidget{
  const DifficultySettings ({Key? key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height *0.026
      ) ,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: myText("Difficulty", Colors.black, 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gameButton(() {
                barrierMovement =0.05;
                write("level",barrierMovement);
              }, "Easy", Colors.green),
              gameButton(() {
                barrierMovement =0.08;
                write("level",barrierMovement);
              }, "Medium", Colors.yellow),
              gameButton(() {
                barrierMovement =0.1;
                write("level",barrierMovement);
              }, "Hard", Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}

 
  