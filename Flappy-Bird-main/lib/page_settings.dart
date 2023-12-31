




import 'package:flappy_bird/Database/functions.dart';
import 'package:flappy_bird/page_start_screen.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flutter/material.dart';

import 'widget/bird_settings.dart';
import 'widget/diffcult_settings.dart';
import 'widget/music_settings.dart';
import 'widget/themes_settings.dart';

class Settings extends StatefulWidget{
  const Settings ({Key? key}): super (key:key);

  @override
  State<Settings> createState() => _SettingsState();


}

class _SettingsState extends State<Settings>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(Str.image),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height *0.08,
                  left: 8,
                  bottom: 10),
              alignment: const Alignment(-1,0),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(
                Icons.arrow_back,size: 50,
                color: Colors.white,
              )),
            ),
            Container(
              width: size.width *0.78,
              height:size.height*0.75,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(10),
              decoration: frame(),
              child: Column(
                children: [
                  myText("Setting",Colors.deepOrange,20),
                  const BirdSettings(),
                  const ThemeSettings(),
                  const MusicSettings(),
                  const DifficultySettings(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyanAccent
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const StartScreen()));
                      }, child: myText("Apply",Colors.white,35)),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}