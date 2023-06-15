import 'package:tourist_places_sim/misc/colors.dart';
import 'package:tourist_places_sim/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.isResponsive = false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    child: AppText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(left: 20),
                  )
                : Container(),
            Image.asset("img/button-one.png")
          ],
        ),
      ),
    );
  }
}
