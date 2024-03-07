import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/presentation/cubit/cars_cubit.dart';
import 'package:wswork_project/src/core/extensions/string_extension.dart';
import 'package:wswork_project/src/core/widgets/ws_button.dart';

class CarsView extends StatefulWidget {
  const CarsView({
    super.key,
    required this.cars,
    this.checkedCar,
  });
  final List<Car> cars;
  final Car? checkedCar;

  @override
  _CarsViewState createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  final controller = Modular.get<CarsCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: widget.cars.length,
                  itemBuilder: (context, index) {
                    final car = widget.cars[index];
                    return CheckboxListTile.adaptive(
                      value: widget.checkedCar?.id == car.id,
                      title: Text(car.nomeModelo),
                      subtitle:
                          Text(car.valor.toString().formatToMoney(context)),
                      onChanged: (value) => controller.checkCar(car),
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: WsButton(
                  title: "Eu quero",
                  opacity: 1,
                  onPressed: widget.checkedCar != null
                      ? () => controller.insertLead(widget.checkedCar!)
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
