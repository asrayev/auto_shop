import '../api_service/api_service.dart';
import '../local_db/local_db.dart';
import '../models/car_item_model.dart';
import '../models/cars_model.dart';

class MyRepository {
  MyRepository({
    required ApiService apiService,
    required LocalDataBase localDatabase,
  }) {
    _apiService = apiService;
    _localDatabase = localDatabase;
  }

  late ApiService _apiService;
  late LocalDataBase _localDatabase;

 Future<Cars> getCarsFromService() => _apiService.getCars();
 Future<CarItem> getCarItemFromService(int index) {
  return _apiService.getCarItem(index);
 }


}
