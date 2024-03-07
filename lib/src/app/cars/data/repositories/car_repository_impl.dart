// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wswork_project/src/app/cars/domain/entities/lead.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/car_repository.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/core/services/client/cliente_service.dart';
import 'package:wswork_project/src/core/services/client/models/ws_request.dart';

class CarRepositoryImpl implements CarRepository {
  final ClientService _clientService;
  CarRepositoryImpl(
    this._clientService,
  );

  @override
  Future<List<Car>> getCars() async {
    final response =
        await _clientService.get(const WsRequest(path: "cars.json"));
    final result = response.body['cars'] as List;
    return result.map((e) => Car.fromJson(e)).toList();
  }

  @override
  Future<void> sendLeads(List<Lead> leads) async {
    List<Map<String, dynamic>> leadsMapList =
        leads.map((lead) => lead.toMap()).toList();
    await _clientService.post(
      WsRequest(
        path: "cars/leads",
        data: {
          'leads': leadsMapList,
        },
      ),
    );
  }
}
