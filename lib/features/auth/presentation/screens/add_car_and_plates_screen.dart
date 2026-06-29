import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/features/auth/presentation/cubit/add_car_and_plates_cubit.dart';
import 'package:warsha_app/features/auth/presentation/cubit/add_car_and_plates_state.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/home_page.dart';
import '../widgets/add_car_top_bar.dart';
import '../widgets/add_car_scanner_card.dart';
import '../widgets/add_car_manual_divider.dart';
import '../widgets/add_car_dropdown_field.dart';
import '../widgets/add_car_save_button.dart';
import '../widgets/add_car_selection_sheet.dart';

/// Screen class to input car registration manual dropdowns or license plates scan
class AddCarAndPlatesScreen extends StatelessWidget {
  final bool isFromProfile;

  const AddCarAndPlatesScreen({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarAndPlatesCubit(),
      child: AddCarAndPlatesView(isFromProfile: isFromProfile),
    );
  }
}

/// Dynamic View layout displaying the Add Car and Plates options
class AddCarAndPlatesView extends StatelessWidget {
  final bool isFromProfile;

  const AddCarAndPlatesView({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AddCarAndPlatesCubit, AddCarAndPlatesState>(
          listener: (context, state) {
            if (state.status == AddCarAndPlatesStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Car registered successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              if (isFromProfile) {
                Navigator.of(context).pop({
                  'brand': state.selectedBrand ?? 'Bmw',
                  'model': state.selectedModel ?? '320i',
                  'year': state.selectedYear?.toString() ?? '2017',
                  'specs': '2.0L',
                  'license': 'License: 789/XYZ',
                });
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              }
            }
          },
          builder: (context, state) {
            final cubit = context.read<AddCarAndPlatesCubit>();

            return Column(
              children: [
                AddCarTopBar(isFromProfile: isFromProfile),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Add your car",
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Roboto'),
                          ),
                          const SizedBox(height: 8),
                          const Text("So we can match you with the right services",
                            style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Roboto'),
                          ),
                          const SizedBox(height: 36),
                          AddCarScannerCard(
                            isScanning: state.status == AddCarAndPlatesStatus.scanning,
                            onTap: () => cubit.scanLicense(),
                          ),
                          const SizedBox(height: 28),
                          const AddCarManualDivider(),
                          const SizedBox(height: 28),
                          AddCarDropdownField(
                            label: 'Select Brand',
                            selectedValue: state.selectedBrand,
                            isEnabled: state.status != AddCarAndPlatesStatus.scanning,
                            onTap: () {
                              AddCarSelectionSheet.show(
                                context: context,
                                title: 'Select Brand',
                                options: cubit.brandModels.keys.toList(),
                                onSelected: (brand) => cubit.selectBrand(brand),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          AddCarDropdownField(
                            label: 'Select Model',
                            selectedValue: state.selectedModel,
                            isEnabled: state.selectedBrand != null &&
                                state.status != AddCarAndPlatesStatus.scanning,
                            onTap: () {
                              AddCarSelectionSheet.show(
                                context: context,
                                title: 'Select Model',
                                options: cubit.brandModels[state.selectedBrand] ?? [],
                                onSelected: (model) => cubit.selectModel(model),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          AddCarDropdownField(
                            label: 'Select Year',
                            selectedValue: state.selectedYear?.toString(),
                            isEnabled: state.selectedModel != null &&
                                state.status != AddCarAndPlatesStatus.scanning,
                            onTap: () {
                              AddCarSelectionSheet.show(
                                context: context,
                                title: 'Select Year',
                                options: List.generate(12, (index) => (2015 + index).toString()),
                                onSelected: (yearStr) => cubit.selectYear(int.parse(yearStr)),
                              );
                            },
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: AddCarSaveButton(
                    isEnabled: state.isFormValid &&
                        state.status != AddCarAndPlatesStatus.scanning &&
                        state.status != AddCarAndPlatesStatus.saving,
                    isSaving: state.status == AddCarAndPlatesStatus.saving,
                    onTap: () => cubit.saveCar(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
