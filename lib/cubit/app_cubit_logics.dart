import 'package:tourist_places_sim/cubit/app_cubit_states.dart';
import 'package:tourist_places_sim/cubit/app_cubits.dart';
import 'package:tourist_places_sim/pages/detail_page.dart';
import 'package:tourist_places_sim/pages/navpages/main_page.dart';
import 'package:tourist_places_sim/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is DetailState) {
            return const DetailPage();
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (state is LoadedState) {
            // return HomePage();
            return const MainPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}