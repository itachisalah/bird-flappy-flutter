




import 'package:flutter/material.dart';

class Cover extends StatelessWidget{
  const Cover ({Key? key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      alignment: Alignment.center,
      child:const Text('Powered by fue',
        style: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontFamily: "Magic4"
        ),
      ),
    );
  }

}