
import 'package:flappy_bird/app_routes.dart';
import 'package:flappy_bird/page_start_screen.dart';
import 'package:flappy_bird/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('user');

  runApp(const MyApp());
}

class MyApp  extends StatelessWidget{
  const MyApp({Key? key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: const StartScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: Str.home,
      onGenerateRoute: AppRoute().generateRoute,

    );

  }
}
