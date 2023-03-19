import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../resources/app_colors.dart';

class BallSpinFadeLoading extends StatelessWidget {
  const BallSpinFadeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            AppColors.icon,
            AppColors.outline,
          ],
          strokeWidth: 1,
        ),
      ),
    );
  }
}
