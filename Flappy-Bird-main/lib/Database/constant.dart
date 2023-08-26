import 'dart:core';

import 'package:audioplayers/audioplayers.dart';


int score = 0;
int topScore = 0;

double yAxis = 0;
double birdWidth = 0.183;
double birdHeight = 0.183;


double time = 0;
double height = 0;
double gravity = -3.9;
double velocity = 2.5;
double initialHeight = yAxis;
bool gameHasStarted= false;


List<double> barrierx = [2,3.4];
double barrierWidth = 0.5;
List<List<double>> barrierHeight = [
  [0.6,0.4],
  [0.4,0.6]
];
double barrierMovement = 0.05;


double screenEnd = -1.9;
double screenStart = 3.5;


final player = AudioPlayer();
bool play =true;