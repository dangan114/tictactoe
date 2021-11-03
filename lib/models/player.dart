import 'package:flutter/material.dart';

class Player {
  late String name;
  late bool turnToPlay;
  late Color color;
  late List<int> moves;

  Player(
      {required this.name,
      required this.turnToPlay,
      required this.color,
      required this.moves});

  void setName(String name) {
    this.name = name;
  }

  void setTurnToPlay(bool turnToPlay) {
    this.turnToPlay = turnToPlay;
  }

  void setColor(Color color) {
    this.color = color;
  }

  void addMove(int move) {
    this.moves.add(move);
  }
}
