import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'position_state.dart';

class PositionCubit extends Cubit<PositionState> {
  PositionCubit() : super(PositionInitial());

  Future<void> determinePosition() async {
    emit(PositionLoading());
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return emit(PositionFailure('Location services are disabled.'));
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try requesting permissions again.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return emit(PositionFailure('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      if (permission == LocationPermission.deniedForever) {
        return emit(PositionFailure(
            'Location permissions are permanently denied, we cannot request permissions.'));
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    try {
      emit(PositionSuccess(await Geolocator.getCurrentPosition()));
    } catch (e) {
      emit(PositionFailure('Error'));
    }
  }
}
