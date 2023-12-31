import 'package:audioplayers/audioplayers.dart';
import 'package:flappy_bird/Database/constant.dart';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flutter/material.dart';




Text myText( String txt, Color? color, double size){
  return Text(
    txt,
    style: TextStyle(
      fontSize: size,
      fontFamily: 'Magic4',
      color: color

    ),
  );
}
ElevatedButton gameButton(VoidCallback? onPress, String txt, Color color){
  return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(primary: color),
      child: myText(txt, Colors.white, 20),
  );

}
BoxDecoration frame(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.black,width: 2),
    color: Colors.white70,
    boxShadow: [BoxShadow(
        color: Colors.cyan.withOpacity(0.6),
        blurRadius:1.0,offset: const Offset(5,5))]
  );
}

BoxDecoration background(String y ){
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
          "assets/pics/$y.png"),
          fit: BoxFit.fill),
  );
}
AlertDialog dialog(BuildContext context){
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    actionsPadding:const EdgeInsets.only(right: 8,bottom: 8),
    title: myText('About Flappy Bir', Colors.black, 25),
    content: const Text(Str.about, style:TextStyle(fontFamily: 'Magic4'),),
    actions: [
      gameButton(() {Navigator.pop(context);}, 'okay', Colors.deepOrange),

    ],

  );
}

void init(){
  if (read("score") != null){
    topScore = read("score");
  }else{
    write("score", topScore);
  }
  if (read("background") != null){
    Str.image = read("background");
  }else{
    write("background", Str.image);
  }
  if (read("bird") != null){
    Str.bird = read("bird");
  }else{
    write("bird", Str.bird);
  }
  if (read("level") != null){
    barrierMovement = read("level");
  }else{
    write("level", barrierMovement);
  }
  if (read("audio") != null){
    play = read("audio");
  }else{
    write("audio", play);
  }
  if(play){
    player.play(AssetSource("assets/audio/Tintin.mp3"));
  }else{
    player.stop();
  }
  player.setReleaseMode(ReleaseMode.loop);
}

void navigate(context,navigate){
  switch(navigate){
    case Str.gamePage:
      Navigator.pushNamed(context, Str.gamePage);
      break;
    case Str.settings:
      Navigator.pushNamed(context, Str.settings);
      break;
    case Str.rateUs:
      Navigator.pushNamed(context, Str.rateUs);
      break;
  }
}

























