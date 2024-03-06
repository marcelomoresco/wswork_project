part of 'cars_cubit.dart';

sealed class CarsState {}

final class CarsInitial extends CarsState {}

final class CarsLoading extends CarsState {}

final class CarsSuccess extends CarsState {
  final List<Car> cars;
  CarsSuccess({required this.cars});
}

final class CarsError extends CarsState {
  final String message;
  CarsError({required this.message});
}
