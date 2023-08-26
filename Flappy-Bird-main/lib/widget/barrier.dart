
import 'package:flutter/material.dart';




class Barrier extends StatelessWidget{

  final double barrierHeight;
  final double barrierWidth;
  final double direction;
  final bool isTop;

  const Barrier(this.barrierHeight, this.barrierWidth, this.direction, this.isTop, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment((
          2*direction+barrierWidth)/ (
          2- barrierWidth),isTop ? 1.1 :-1.1),
      duration: const Duration(milliseconds: 0),
      child: Container(
        height: (size.height) / (4*barrierHeight)/2,
        width: size.width* barrierWidth/2,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            width: 10,
            color: Colors.greenAccent
          ),
          borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }

}