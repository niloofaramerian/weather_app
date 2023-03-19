import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils/enums/nav_bar.dart';
import '../../logic/cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import '../resources/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: BlocBuilder<BottomNavBarCubit, NavBar>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [NavBar.home, NavBar.weatherSearch, NavBar.settings]
                .map((item) => InkWell(
                      onTap: () {
                        context
                            .read<BottomNavBarCubit>()
                            .changeNavBarItem(item);
                      },
                      child: item == state
                          ? Icon(
                              item.iconData,
                              color: AppColors.icon,
                              size: 30,
                            )
                          : Icon(
                              item.iconData,
                              color: AppColors.outline,
                              size: 26,
                            ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
