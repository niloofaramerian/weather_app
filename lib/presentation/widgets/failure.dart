import 'package:flutter/material.dart';
import 'package:weather_app/data/utils/constants.dart';

import '../resources/app_dimensions.dart';

class Failure extends StatelessWidget {
  const Failure({
    Key? key,
    required this.message,
    required this.onPress,
  }) : super(key: key);

  final String message;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBoxH8,
          Image.asset(
            'images/location.png',
            width: 200,
            height: 200,
          ),
          Text(message),
          TextButton(
            onPressed: onPress,
            child: const Text(tryAgain),
          )
        ],
      ),
    );
  }
}
