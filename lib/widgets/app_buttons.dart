import 'package:tourist_places_sim/misc/colors.dart';
import 'package:tourist_places_sim/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {

  final Color color;
  final Color bgColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;


  AppButtons({Key? key, required this.color, required this.bgColor, required this.borderColor, required this.size, this.text="Hi", this.icon, this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
      ),
      child: isIcon! ? Center(child: Icon(icon, color: color,)) : Center(child: AppText(text: text!, color: color,)),
    );
  }
}
