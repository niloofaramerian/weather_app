import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubit/bottom_nav_bar_cubit.dart';
import 'package:weather_app/presentation/resources/app_theme.dart';

import 'presentation/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBarCubit()),
      ],
      child: MaterialApp(
        title: 'Weather Forecast',
        theme: appTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
