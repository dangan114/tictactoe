import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Winner extends StatefulWidget {
  Winner({Key? key, required this.winner});
  late String winner;

  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.winner == 'Tie!' ? 'Tie!' : widget.winner + ' Wins!',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(title: "TicTacToe")),
                      );
                    },
                    child: Text('Play Again?')))));
  }
}
