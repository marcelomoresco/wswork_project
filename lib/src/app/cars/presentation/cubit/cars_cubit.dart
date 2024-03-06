import 'package:bloc/bloc.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/car_repository.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository carRepository;
  CarsCubit(this.carRepository) : super(CarsInitial());

  List<Car> checkedList = [];

  void initial() async {
    checkedList.clear();
    emit(CarsLoading());
    final cars = await carRepository.getCars();
    emit(CarsSuccess(cars: cars));
  }

  void sendLead() {}
}
