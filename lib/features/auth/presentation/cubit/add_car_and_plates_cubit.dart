import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_car_and_plates_state.dart';

/// Cubit managing Add Car and Plates manual/auto registration
class AddCarAndPlatesCubit extends Cubit<AddCarAndPlatesState> {
  AddCarAndPlatesCubit() : super(const AddCarAndPlatesState());

  /// Dataset mapping brands to their corresponding models
  final Map<String, List<String>> brandModels = const {
    'BMW': ['320i', 'X5', 'M4'],
    'Mercedes': ['C200', 'G63', 'E300'],
    'Toyota': ['Corolla', 'Land Cruiser', 'Camry'],
  };

  /// Set selected Brand, clearing dependent model and year selection
  void selectBrand(String brand) {
    emit(state.copyWith(
      selectedBrand: brand,
      clearModel: true,
      clearYear: true,
    ));
  }

  /// Set selected Model, clearing dependent year selection
  void selectModel(String model) {
    emit(state.copyWith(
      selectedModel: model,
      clearYear: true,
    ));
  }

  /// Set manufacturing Year
  void selectYear(int year) {
    emit(state.copyWith(selectedYear: year));
  }

  /// Triggers a simulated camera scanning delay and auto-populates inputs
  Future<void> scanLicense() async {
    emit(state.copyWith(status: AddCarAndPlatesStatus.scanning));

    // Simulate a 2-second processing time
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      status: AddCarAndPlatesStatus.scanned,
      selectedBrand: 'BMW',
      selectedModel: '320i',
      selectedYear: 2017,
    ));
  }

  /// Saves the car data into memory and transitions state
  Future<void> saveCar() async {
    if (state.isFormValid) {
      emit(state.copyWith(status: AddCarAndPlatesStatus.saving));
      
      // Simulate save delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      emit(state.copyWith(status: AddCarAndPlatesStatus.success));
    }
  }
}
