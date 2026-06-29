import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/theme/app_text_styles.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/workshop_card.dart';
import '../widgets/booking_card.dart';

/// HomePage is the main home screen of the application
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load data when page initializes
    context.read<HomeBloc>().add(const LoadFeaturedWorkshopsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warsha'),
        elevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryOrange,
              ),
            );
          }

          if (state is HomeErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(const LoadFeaturedWorkshopsEvent());
                    },
                    child: const Text('إعادة محاولة'),
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(const RefreshHomeDataEvent());
              },
              color: AppColors.primaryOrange,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Welcome Section
                      Text(
                        'أهلا بك في Warsha',
                        style: AppTextStyles.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'احجز موعد صيانة سيارتك بسهولة',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Featured Workshops
                      Text(
                        'الورش المميزة',
                        style: AppTextStyles.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      if (state.workshops.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text('لا توجد ورش متاحة حالياً'),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.workshops.length,
                          itemBuilder: (context, index) {
                            return WorkshopCard(
                              workshop: state.workshops[index],
                            );
                          },
                        ),
                      const SizedBox(height: 24),

                      // Upcoming Bookings
                      Text(
                        'حجوزاتك القادمة',
                        style: AppTextStyles.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      if (state.bookings.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text('لا توجد حجوزات قادمة'),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.bookings.length,
                          itemBuilder: (context, index) {
                            return BookingCard(
                              booking: state.bookings[index],
                            );
                          },
                        ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(
            child: Text('حالة غير معروفة'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to new booking screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('احجز موعد جديد')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
