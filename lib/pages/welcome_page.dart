import 'package:tourist_places_sim/cubit/app_cubits.dart';
import 'package:tourist_places_sim/misc/colors.dart';
import 'package:tourist_places_sim/widgets/app_text.dart';
import 'package:tourist_places_sim/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List text = [
    "Mountain hikes give you an incredible sense of freedom along with endurance test",
    "Gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Permberton.",
    "Embrace the breeze as you walk through the lake and feel it's natural warmth along with the chirping of birds.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/${images[index]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTextLarge(
                          text: "Trips",
                          color: Colors.black,
                        ),
                        // AppText(text: "Discover", color: Colors.red,)
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            // text: "Mountain hikes gives you an incredible sense of freedom along with endurance test",
                            text: text[index],
                            color: Colors.black87,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: SizedBox(
                              width: 200, child: Row(
                                children: const [
                                  ResponsiveButton(width: 120),
                                ],
                              )
                            ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(images.length, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
