import 'package:warsha_app/core/network/api_result.dart';
import '../repositories/home_repository.dart';
import '../entities/workshop_entity.dart';

/// GetFeaturedWorkshopsUsecase is responsible for fetching featured workshops
class GetFeaturedWorkshopsUsecase {
  final HomeRepository repository;

  GetFeaturedWorkshopsUsecase({required this.repository});

  Future<ApiResult<List<Workshop>>> call() {
    return repository.getFeaturedWorkshops();
  }
}
