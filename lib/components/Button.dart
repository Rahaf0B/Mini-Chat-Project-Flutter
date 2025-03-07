import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  const ButtonWidget(
      {super.key,
        required this.color,
        required this.onPressed,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}
