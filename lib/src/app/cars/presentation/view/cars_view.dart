import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/presentation/cubit/cars_cubit.dart';
import 'package:wswork_project/src/core/widgets/ws_button.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key, required this.cars});
  final List<Car> cars;

  @override
  _CarsViewState createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  final controller = Modular.get<CarsCubit>();
  List<Car> checkedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final car = widget.cars[index];
                return CheckboxListTile.adaptive(
                  value: checkedList.contains(car),
                  onChanged: (value) {
                    setState(() {
                      checkedList.add(car);
                    });
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: checkedList.isEmpty,
                child: WsButton(
                  title: "Eu quero",
                  opacity: checkedList.isEmpty ? 1 : 0.5,
                  onPressed: checkedList.isNotEmpty
                      ? () => controller.sendLead()
                      : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
