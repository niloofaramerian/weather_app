import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/utils/enums/nav_bar.dart';
import 'package:weather_app/logic/cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimensions.dart';
import '../widgets/bottom_nav_bar.dart';
import 'screens.dart';

final _screens = {
  NavBar.home: const HomeScreen(),
  NavBar.weatherSearch: const WeatherSearchScreen(),
  NavBar.settings: const SettingsScreen(),
};

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:
          SafeArea(child: _screens[context.watch<BottomNavBarCubit>().state]!),
      floatingActionButton: Container(
        padding: paddingV12,
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: borderRadius20,
        ),
        child: const BottomNavBar(),
      ),
    );
  }
}
