


import 'package:flappy_bird/Database/functions.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';

import 'strings.dart';

class RateUs extends StatelessWidget{
  const RateUs ({Key? key}): super (key:key);
  final double rating = 4.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
        width: size.width,
        height: size.height,
        decoration: background(Str.image),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingDialog(
              title: myText("Rate us",Colors.blue,25),
              image: const Icon(Icons.star,size: 100,color: Colors.red,),
              submitButtonText: 'Sumbit',
              onSubmitted: (response ) {

              },

            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade300,
                ),
                onPressed: () {
                  Share.share('https');

                }, child: const Icon(
                Icons.share_rounded,size: 30,
              ),

              ),
            )
          ],
        ),

      ) ,
    );
  }

}