import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth);
    print(screenHeight);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'HEALTH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: const Color.fromARGB(255, 88, 133, 225),
          ),
        ),
        Text(
          'LK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: const Color.fromARGB(255, 183, 183, 183),
          ),
        ),
      ],
    ); 
  }
}