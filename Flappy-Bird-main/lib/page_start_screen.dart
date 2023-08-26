



import 'package:flappy_bird/Database/constant.dart';
import 'package:flappy_bird/Database/functions.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flappy_bird/widget/bird.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'widget/button.dart';

class StartScreen extends StatefulWidget{
  const StartScreen ({Key? key}): super (key:key);

  @override
  State<StartScreen> createState()=> _StartScreenState();

}

class _StartScreenState extends State<StartScreen>{
  final myBox= Hive.box('user');


  void iniState(){
    init();
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(Str.image),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.25),
              child:myText(
                  "FlappyBird",
                  Colors.white,70),
            ),
            Bird(yAxis, birdWidth, birdHeight),
            _buttons(),
            AboutUs(size: size,)
          ],
        ),

      ),

    );
  }
  }



Column _buttons(){
  return Column(
    children: [
      const Button (
          buttonType: 'Text',
          height:60,
          width:278,
          icon: Icon(
            Icons.play_arrow_rounded,
            size: 60,
            color: Colors.green,
          ),
        page:Str.gamePage

      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const[
          Button(
              buttonType: 'Icon',
              height:60,
              width:110,
              icon: Icon(
                Icons.settings,
                size: 40,
                color: Colors.green,
              ),
              page:Str.settings
          ),
          Button(
              buttonType: 'Icon',
              height:60,
              width:110,
              icon: Icon(
                Icons.star,
                size: 40,
                color: Colors.deepOrange,
              ),
              page:Str.gamePage

          ),

        ],

      ),
    ],
  );
}
class AboutUs extends StatelessWidget{
  final Size size;
  const AboutUs ({required this.size,Key? key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height*0.2),
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (context){
            return dialog(context);
          });
        },
        child: myText('About us ', Colors.white,20),
      ),


    );
  }
}