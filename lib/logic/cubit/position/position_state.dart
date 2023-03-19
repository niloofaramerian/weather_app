part of 'position_cubit.dart';

@immutable
abstract class PositionState {}

class PositionInitial extends PositionState {}

class PositionLoading extends PositionState {}

class PositionSuccess extends PositionState {
  final Position position;

  PositionSuccess(this.position);
}

class PositionFailure extends PositionState {
  final String error;

  PositionFailure(this.error);
}
