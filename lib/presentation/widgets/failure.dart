import 'package:flutter/material.dart';

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
            'images/empty_state/no_gps.png',
            width: MediaQuery.of(context).size.width / 1.2,
            fit: BoxFit.fill,
          ),
          Text(message),
          TextButton(
            onPressed: onPress,
            child: const Text("try again"),
          )
        ],
      ),
    );
  }
}
