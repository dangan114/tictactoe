import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/components/home.dart';

class Player extends StatefulWidget {
  Player({Key? key});

  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final player1TextController = TextEditingController();
  final player2TextController = TextEditingController();

  String player1Name = "Player 1";
  String player2Name = "Player 2";

  @override
  void dispose() {
    super.dispose();
    player1TextController.dispose();
    player2TextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('TicTacToe'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Player 1"),
                                controller: player1TextController,
                                onChanged: (text) {
                                  setState(() {
                                    player1Name = text;
                                  });
                                }))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Player 2"),
                                controller: player2TextController,
                                onChanged: (text) {
                                  setState(() {
                                    player2Name = text;
                                  });
                                }))),
                  ],
                ),
              ),
              Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(40),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                      player1: player1Name,
                                      player2: player2Name)),
                            );
                          },
                          child: Text('Lets Play'))))
            ]))));
  }
}
