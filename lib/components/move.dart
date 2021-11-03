import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/player.dart';

class Move extends StatefulWidget {
  int position;
  Color color;
  Function(int) callback;

  Move(
      {Key? key,
      required this.position,
      required this.color,
      required this.callback})
      : super(key: key);

  int getPosition() {
    return this.position;
  }

  @override
  _MoveState createState() => _MoveState();
}

class _MoveState extends State<Move> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: ElevatedButton(
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: MaterialStateProperty.all(widget.color)),
            onPressed: () {
              widget.callback(widget.position);
            },
            child: Text('${widget.position}',
                style: const TextStyle(fontSize: 10.0, color: Colors.amber))));
  }
}
