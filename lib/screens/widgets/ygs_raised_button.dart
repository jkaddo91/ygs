import 'package:flutter/material.dart';

class YgsRaisedButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;

  const YgsRaisedButton({
    @required this.onPressed,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 350,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        color: Colors.blueGrey,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}