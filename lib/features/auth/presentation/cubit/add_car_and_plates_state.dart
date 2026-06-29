import 'package:equatable/equatable.dart';

/// Enum representing states of the Add Car and Plates flow
enum AddCarAndPlatesStatus { initial, scanning, scanned, saving, success }

/// State class for AddCarAndPlatesCubit
class AddCarAndPlatesState extends Equatable {
  final AddCarAndPlatesStatus status;
  final String? selectedBrand;
  final String? selectedModel;
  final int? selectedYear;
  final String? errorMessage;

  const AddCarAndPlatesState({
    this.status = AddCarAndPlatesStatus.initial,
    this.selectedBrand,
    this.selectedModel,
    this.selectedYear,
    this.errorMessage,
  });

  /// Check if all forms details have been successfully selected
  bool get isFormValid =>
      selectedBrand != null && selectedModel != null && selectedYear != null;

  AddCarAndPlatesState copyWith({
    AddCarAndPlatesStatus? status,
    String? selectedBrand,
    String? selectedModel,
    int? selectedYear,
    String? errorMessage,
    bool clearBrand = false,
    bool clearModel = false,
    bool clearYear = false,
  }) {
    return AddCarAndPlatesState(
      status: status ?? this.status,
      selectedBrand: clearBrand ? null : (selectedBrand ?? this.selectedBrand),
      selectedModel: clearModel ? null : (selectedModel ?? this.selectedModel),
      selectedYear: clearYear ? null : (selectedYear ?? this.selectedYear),
      errorMessage: errorMessage, // Resets error if null is passed
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedBrand,
        selectedModel,
        selectedYear,
        errorMessage,
      ];
}
