import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warsha_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:warsha_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:warsha_app/features/home/domain/repositories/home_repository.dart';
import 'package:warsha_app/features/home/domain/usecases/get_featured_workshops_usecase.dart';
import 'package:warsha_app/features/home/domain/usecases/get_upcoming_bookings_usecase.dart';
import 'package:warsha_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:warsha_app/features/auth/presentation/cubit/language_cubit.dart';
import '../network/dio_client.dart';
import '../constants/app_constants.dart';

/// Service Locator configuration for dependency injection
final getIt = GetIt.instance;

/// Initialize all dependencies
Future<void> setupServiceLocator() async {
  // Local Storage (SharedPreferences)
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Network
  getIt.registerSingleton<DioClient>(
    DioClient(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(
        milliseconds: AppConstants.connectTimeout,
      ),
      receiveTimeout: const Duration(
        milliseconds: AppConstants.receiveTimeout,
      ),
    ),
  );

  // Home Feature - Data Sources
  getIt.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImpl(),
  );

  // Home Feature - Repositories
  getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(
      localDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  // Home Feature - Usecases
  getIt.registerSingleton<GetFeaturedWorkshopsUsecase>(
    GetFeaturedWorkshopsUsecase(
      repository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerSingleton<GetUpcomingBookingsUsecase>(
    GetUpcomingBookingsUsecase(
      repository: getIt<HomeRepository>(),
    ),
  );

  // Home Feature - Bloc
  getIt.registerSingleton<HomeBloc>(
    HomeBloc(
      getFeaturedWorkshopsUsecase: getIt<GetFeaturedWorkshopsUsecase>(),
      getUpcomingBookingsUsecase: getIt<GetUpcomingBookingsUsecase>(),
    ),
  );

  // Auth Feature - Cubit
  getIt.registerLazySingleton<LanguageCubit>(
    () => LanguageCubit(getIt<SharedPreferences>()),
  );
}

