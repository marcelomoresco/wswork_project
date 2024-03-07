part of 'cars_cubit.dart';

sealed class CarsState {}

final class CarsInitial extends CarsState {}

final class CarsLoading extends CarsState {}

final class CarsSuccess extends CarsState {
  final List<Car> cars;
  final Car? checkedCar;
  CarsSuccess({this.checkedCar, required this.cars});
}

final class CarsError extends CarsState {
  final String message;
  CarsError({required this.message});
}
