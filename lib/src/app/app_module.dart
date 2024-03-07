import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/cars_module.dart';
import 'package:wswork_project/src/core/services/client/cliente_service.dart';
import 'package:wswork_project/src/core/services/client/dio/custom_dio.dart';
import 'package:wswork_project/src/core/services/client/dio/dio_client_service.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CarsModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<ClientService>(
            (i) => DioClientService(dio: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/",
          module: CarsModule(),
        ),
      ];
}
