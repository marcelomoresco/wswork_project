import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/data/repositories/car_repository_impl.dart';
import 'package:wswork_project/src/app/cars/data/repositories/lead_repository_impl.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/car_repository.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/lead_repository.dart';
import 'package:wswork_project/src/app/cars/presentation/cubit/cars_cubit.dart';
import 'package:wswork_project/src/app/cars/presentation/page/cars_page.dart';

class CarsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarRepository>((i) => CarRepositoryImpl(i.get())),
        Bind.lazySingleton<LeadRepository>((i) => LeadRepositoryImpl()),
        Bind.lazySingleton<CarsCubit>((i) => CarsCubit(i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CarsPage(),
          transition: TransitionType.defaultTransition,
        ),
      ];
}
