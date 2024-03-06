import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/data/repositories/car_repository_impl.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/car_repository.dart';
import 'package:wswork_project/src/app/cars/presentation/cubit/cars_cubit.dart';
import 'package:wswork_project/src/app/cars/presentation/page/cars_page.dart';
import 'package:wswork_project/src/core/services/client/cliente_service.dart';
import 'package:wswork_project/src/core/services/client/dio/custom_dio.dart';
import 'package:wswork_project/src/core/services/client/dio/dio_client_service.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<ClientService>(
            (i) => DioClientService(dio: i.get())),
        Bind.lazySingleton<CarRepository>((i) => CarRepositoryImpl(i.get())),
        Bind.lazySingleton<CarsCubit>((i) => CarsCubit(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          'cars',
          child: (context, args) => const CarsPage(),
          transition: TransitionType.defaultTransition,
        ),
      ];
}
