import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        ],

    );
  }
}