import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/presentation/cubit/cars_cubit.dart';
import 'package:wswork_project/src/app/cars/presentation/view/cars_view.dart';
import 'package:wswork_project/src/app/cars/presentation/widgets/app_bar/cars_app_bar.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final controller = Modular.get<CarsCubit>();

  @override
  void initState() {
    controller.initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CarsAppBar(),
      body: BlocBuilder<CarsCubit, CarsState>(
        bloc: controller,
        builder: (context, state) {
          if (state is CarsSuccess) {
            return CarsView(
              cars: state.cars,
            );
          } else if (state is CarsError) {
            return const SizedBox.shrink();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
