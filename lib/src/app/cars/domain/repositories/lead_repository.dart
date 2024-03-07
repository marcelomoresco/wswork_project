import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/domain/entities/lead.dart';

abstract interface class LeadRepository {
  Future<void> insertLead(Car car);
  Future<List<Lead>> getAllLeads();
  Future<void> deleteAll();
}
