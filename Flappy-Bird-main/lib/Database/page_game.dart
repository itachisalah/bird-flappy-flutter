





import 'dart:async';

import 'package:flappy_bird/Database/constant.dart';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Database/functions.dart';
import 'package:flappy_bird/page_start_screen.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flappy_bird/widget/barrier.dart';
import 'package:flappy_bird/widget/bird.dart';
import 'package:flappy_bird/widget/cover.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GamePage extends StatefulWidget{
  const GamePage({Key? key}): super (key:key);

  @override
  State<GamePage> createState()=> _GamePageState();

}

class _GamePageState extends State<GamePage>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: background(Str.image),
                child: Stack(
                  children: [
                    Bird(yAxis,birdWidth,birdHeight),
                    Container(
                      alignment: const Alignment(0,-0.3),
                      child: myText(
                          gameHasStarted ? '' :'TAP TO START', Colors.white, 26),
                    ),
                    Barrier(barrierHeight[0][0],barrierWidth, barrierx[0], true),
                    Barrier(barrierHeight[0][1],barrierWidth, barrierx[0], false),
                    Barrier(barrierHeight[1][0],barrierWidth, barrierx[1], true),
                    Barrier(barrierHeight[1][1],barrierWidth, barrierx[1], false),
                    Positioned(
                        bottom: 1,right: 1,left: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Score :$score",
                              style:const TextStyle(
                                  color: Colors.white,fontSize: 30,fontFamily: 'Magic4'
                              ),
                            ),
                            Text("Best :$topScore",
                              style:const TextStyle(
                                  color: Colors.white,fontSize: 30,fontFamily: 'Magic4'
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
          ),
          const Expanded(
              flex:1,
              child: Cover(),
          ),
        ],
        ),

      ),
    );


    }
  void jump(){
    setState(() {
      time= 0;
      initialHeight= yAxis;
    });
  }
  void startGame(){
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 30),(timer){
      height= gravity * time * time + velocity*time;
      setState(() {
        yAxis= initialHeight- height;
      });

      setState(() {
        if (barrierx[0]< screenEnd){
          barrierx[0]+= screenStart;
        }else{
          barrierx[0]-= barrierMovement;
        }
      });
      setState(() {
        if (barrierx[1]< screenEnd){
          barrierx[1]+= screenStart;
        }else{
          barrierx[1]-= barrierMovement;
        }
      });
      if (birdIsDead()){
        timer.cancel();
        _showDialog();
      }
      time += 0.032;

    });

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (birdIsDead()){
        write("score", topScore);
        timer.cancel();
        score=0;
      }else{
        setState(() {
          if(score== topScore){
            topScore++;
          }
        });
      }
    });
  }
  bool birdIsDead(){
    if(yAxis > 1.26 || yAxis < -1.1){
      return true;
    }
    for(int i = 0; i < barrierx.length; i++){
      if (barrierx[i] <= barrierWidth &&
          (barrierx[i]+ (barrierWidth))>= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0]||
              yAxis + birdHeight >= 1 - barrierHeight[i][1]) ) {
        return true;
      }
    }
    return false;
  }
  void resetGame(){
    Navigator.pop(context);
    setState(() {
      yAxis=0;
      gameHasStarted= false;
      time=0;
      score= 0;
      initialHeight= yAxis;
      barrierx[0]= 2;
      barrierx[1]= 3.4;


    });
  }
  void _showDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: myText("..OOps",Colors.blueGrey,35),
            actionsPadding: const EdgeInsets.only(right: 8,bottom: 8),
            content: Container(
              child: Lottie.asset("assets/pics/loss.json",
                fit:BoxFit.cover),
            ),
            actions: [
              gameButton(() {
                resetGame();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const StartScreen(),));
              }, "Exit", Colors.green),
              gameButton(() {
                resetGame();
              }, "try Again ", Colors.yellowAccent),
            ],

          );
        },
    );
  }



}