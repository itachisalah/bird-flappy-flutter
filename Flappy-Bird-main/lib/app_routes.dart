
import 'package:flappy_bird/page_start_screen.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flutter/material.dart';

import 'Database/page_game.dart';
import 'page_rate_us.dart';
import 'page_settings.dart';


class AppRoute{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Str.home:
        return MaterialPageRoute(builder: (_)=>const StartScreen() );
      case Str.gamePage:
        return MaterialPageRoute(builder: (_)=>const GamePage() );
      case Str.rateUs:
        return MaterialPageRoute(builder: (_)=>const RateUs() );
      case Str.settings:
        return MaterialPageRoute(builder: (_)=>Settings() );
      default:
        _errorRoute();

    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title:const Text("Error Page"),
          backgroundColor: Colors.red,
        ),
        body:const Center(
          child: Text('Error'),
        ),
      );
    },);

  }

}