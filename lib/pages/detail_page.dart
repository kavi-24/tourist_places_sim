import 'package:tourist_places_sim/cubit/app_cubit_states.dart';
import 'package:tourist_places_sim/cubit/app_cubits.dart';
import 'package:tourist_places_sim/misc/colors.dart';
import 'package:tourist_places_sim/widgets/app_buttons.dart';
import 'package:tourist_places_sim/widgets/app_text.dart';
import 'package:tourist_places_sim/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                  // left: 20
                  left: 10,
                  top: 70,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  )),
              Positioned(
                // top: 330
                top: 280,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextLarge(
                              text: detail.place.name,
                              color: Colors.black54.withOpacity(0.8),
                              size: 25,),
                          AppTextLarge(
                            text: "\$ "+detail.place.price.toString(),
                            color: AppColors.mainColor,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: detail.place.stars > index
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          })),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(" + detail.place.stars.toString() + ".0)",
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AppTextLarge(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              // icon: Icons.favorite_border,
                              // isIcon: true,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      })),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextLarge(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text:
                            detail.place.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(children: [
                    AppButtons(
                        color: AppColors.textColor2,
                        bgColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite_border),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ]))
            ],
          ),
        ),
      );
    });
  }
}
