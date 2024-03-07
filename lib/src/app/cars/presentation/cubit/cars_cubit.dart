import 'package:bloc/bloc.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/car_repository.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/lead_repository.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository _carRepository;
  final LeadRepository _leadRepository;
  CarsCubit(this._carRepository, this._leadRepository) : super(CarsInitial());

  late List<Car> cars;

  void initial() async {
    try {
      emit(CarsLoading());
      cars = await _carRepository.getCars();
      emit(CarsSuccess(checkedCar: null, cars: cars));
    } catch (e) {
      emit(CarsError(message: e.toString()));
    }
  }

  void checkCar(Car car) {
    emit(CarsSuccess(checkedCar: car, cars: cars));
  }

  void insertLead(Car car) async {
    emit(CarsLoading());
    await _leadRepository.insertLead(car);
    emit(CarsSuccess(checkedCar: null, cars: cars));
  }

  Future<void> sendLeads() async {
    final leads = await _leadRepository.getAllLeads();
    print(leads);
    if (leads.isNotEmpty) {
      await _carRepository.sendLeads(leads);
      await _leadRepository.deleteAll();
    }
  }
}
