import 'package:auto_shop/data/models/car_item_model.dart';
import 'package:auto_shop/data/models/cars_model.dart';
import 'package:auto_shop/data/repositories/my_repository.dart';
import 'package:flutter/cupertino.dart';

class CarViewModel extends ChangeNotifier {
  CarViewModel({required MyRepository myRepository}){
    _myRepository = myRepository;
  }
  late MyRepository _myRepository;

  bool isLoading = false;
  Cars? carData;

  CarItem? carItemData;

  fetchAllCarInfo(int index) async {
  notify(true);
  carData = await _myRepository.getCarsFromService();
  carItemData = await _myRepository.getCarItemFromService(index);
  //you must change
  notify(false);
 }

  notify(bool value){
    isLoading = value;
    notifyListeners();
  }
}
