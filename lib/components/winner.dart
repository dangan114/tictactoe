import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/components/home.dart';
import 'package:project/components/player.dart';

class Winner extends StatefulWidget {
  Winner(
      {Key? key,
      required this.winner,
      required this.loser,
      required this.isTie});
  late String winner;
  late String loser;
  late bool isTie;

  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.isTie ? 'Tie!' : widget.winner + ' Wins!',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                player1: widget.winner, player2: widget.loser)),
                      );
                    },
                    child: Text('Play Again?'))),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Player()),
                      );
                    },
                    child: Text('New Players?')))
          ],
        )));
  }
}
