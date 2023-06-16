import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {

  final double size;
  final String text;
  final Color color;

  const AppTextLarge({ Key? key,
  this.size=30,
  required this.text,
  this.color=Colors.black,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AppText extends StatelessWidget {

  final double size;
  final String text;
  final Color color;
  
  const AppText({ Key? key,
  this.size=16,
  required this.text,
  this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}