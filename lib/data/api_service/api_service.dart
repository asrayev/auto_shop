import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import '../models/car_item_model.dart';
import '../models/cars_model.dart';

class ApiService {
  Future<Cars> getCars() async {
    try {
      Response response =
      await https.get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));
      if (200 <= response.statusCode && response.statusCode <=300)
      {
        Cars carsData = Cars.fromJson(jsonDecode(response.body));
        return carsData;
      }
      else
      {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  
  
  Future<CarItem> getCarItem(int index) async {
    try{
      Response response = await https.get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/${index}"));

      if(200 <= response.statusCode && response.statusCode <=300)
      {
        CarItem carItemData = CarItem.fromJson(jsonDecode(response.body));
        return carItemData;
      }
      else
      {
        throw Exception();
      }

    }catch(e){
      throw Exception(e);
    }
  }
  
  
}