import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/domain/entities/lead.dart';

abstract interface class CarRepository {
  Future<List<Car>> getCars();
  Future<void> sendLeads(List<Lead> leads);
}
