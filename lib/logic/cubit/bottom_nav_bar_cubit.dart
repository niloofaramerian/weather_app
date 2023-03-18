import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils/enums/nav_bar.dart';

class BottomNavBarCubit extends Cubit<NavBar> {
  BottomNavBarCubit() : super(NavBar.home);

  void changeNavBarItem(NavBar navBar) => emit(navBar);
}
