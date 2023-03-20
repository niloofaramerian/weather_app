import 'package:flutter/material.dart';

import '../../../resources/app_text_theme.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/empty_state/no_gps.png',
          width: MediaQuery.of(context).size.width / 1.2,
          fit: BoxFit.fill,
        ),
        const Text(
          'city not found',
          style: bodyLarge,
        ),
      ],
    );
  }
}
