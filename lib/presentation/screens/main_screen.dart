import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimensions.dart';
import '../widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: paddingH12,
        decoration: BoxDecoration(
          color: AppColors.icon.withOpacity(0.05),
          borderRadius: borderRadius20,
        ),
        child: const BottomNavBar(),
      ),
    );
  }
}
