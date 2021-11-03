import 'package:flutter/material.dart';
import 'package:project/components/move.dart';
import 'package:project/models/player.dart';
import 'package:project/components/winner.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.player1, required this.player2})
      : super(key: key);

  String player1;
  String player2;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> result = [];

  late String winner;
  late String loser;
  late bool isTie;

  late Player piggie;
  late Player baby;

  _MyHomePageState() {
    winner = '';
    loser = '';
    isTie = false;
    piggie = new Player(
        name: '', turnToPlay: false, color: Colors.pinkAccent, moves: []);

    baby = new Player(
        name: '', turnToPlay: true, color: Colors.blueAccent, moves: []);

    for (var i = 1; i <= 9; i++) {
      result.add(Move(position: i, color: Colors.white, callback: callback));
    }
  }

  void clicked(position) {}

  void callback(position) {
    addMove(position);

    setState(() {
      result[position - 1] =
          Move(position: position, color: getColor(), callback: clicked);
    });

    calculation();

    setNextTurn();
  }

  bool checkSublist(List<int> targetList, List<int> subList) {
    var counter = 0;
    for (var i = 0; i < targetList.length; i++) {
      for (var j = 0; j < subList.length; j++) {
        if (targetList[i] == subList[j]) {
          counter++;
        }
      }
    }

    if (counter == 3) {
      return true;
    } else
      return false;
  }

  void calculation() {
    if (baby.moves.length >= 3 || piggie.moves.length >= 3) {
      List<List<int>> a = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7],
      ];

      if (piggie.moves.length + baby.moves.length == 9) {
        setState(() {
          winner = piggie.name;
          loser = baby.name;
          isTie = true;
        });
      }

      for (var i = 0; i < a.length; i++) {
        if (piggie.turnToPlay) {
          if (checkSublist(piggie.moves, a[i])) {
            setState(() {
              winner = piggie.name;
              loser = baby.name;
            });
          }
        } else {
          if (checkSublist(baby.moves, a[i])) {
            setState(() {
              winner = baby.name;
              loser = piggie.name;
            });
          }
        }
      }
    }
  }

  void addMove(int position) {
    if (piggie.turnToPlay) {
      piggie.addMove(position);
    } else {
      baby.addMove(position);
    }
  }

  Color getColor() {
    if (piggie.turnToPlay)
      return piggie.color;
    else
      return baby.color;
  }

  void setNextTurn() {
    if (piggie.turnToPlay) {
      piggie.setTurnToPlay(false);
      baby.setTurnToPlay(true);
    } else {
      piggie.setTurnToPlay(true);
      baby.setTurnToPlay(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    piggie.setName(widget.player1);
    baby.setName(widget.player2);

    if (winner.isNotEmpty) {
      Future.delayed(const Duration(microseconds: 10), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Winner(winner: winner, loser: loser, isTie: isTie)),
        );
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('TicTacToe'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${piggie.name}',
                      style:
                          TextStyle(fontSize: piggie.turnToPlay ? 30.0 : 15.0)),
                  Text('VS'),
                  Text(
                    '${baby.name}',
                    style: TextStyle(fontSize: baby.turnToPlay ? 30.0 : 15.0),
                  )
                ],
              ),
            ),
            GridView.count(
                crossAxisCount: 3, shrinkWrap: true, children: result.toList())
          ],
        )));
  }
}
