import 'package:weather_app/src/entity/provider_info.dart';
import 'package:weather_app/src/services/repository/base/base_provider_repository.dart';

class SqlLiteProviderRepository implements BaseProviderRepository {

  @override
  Future<ProviderEntity> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<ProviderEntity>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

}