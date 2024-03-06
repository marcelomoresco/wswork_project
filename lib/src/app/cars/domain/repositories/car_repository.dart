import 'package:wswork_project/src/app/cars/domain/entities/car.dart';

abstract interface class CarRepository {
  Future<List<Car>> getCars();
  Future<void> sendLead();
}
