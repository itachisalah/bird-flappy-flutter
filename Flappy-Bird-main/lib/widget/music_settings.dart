


import 'package:flappy_bird/Database/constant.dart';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Database/functions.dart';
import 'package:flutter/material.dart';

class MusicSettings extends StatefulWidget{
  const MusicSettings ({Key? key}): super (key:key);

  @override
  State<MusicSettings> createState() =>_MusicSettingsState();


}

class _MusicSettingsState extends State<MusicSettings>{
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child:myText("Music",Colors.black,20),
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async{
                    write("Audio",true);
                    await player.resume();
                  },
                  child: const Icon(Icons.music_note_outlined,size: 40,)),
                GestureDetector(
                    onTap: () async{
                      write("Audio",false);
                      await player.pause();
                    },
                    child: const Icon(Icons.music_off_outlined,size: 40,)),
              ],
              ),
          ],
    ),
    );
  }
  }

