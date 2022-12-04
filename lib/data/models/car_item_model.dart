import 'dart:convert';

CarItem carItemFromJson(String str) => CarItem.fromJson(json.decode(str));

String carItemToJson(CarItem data) => json.encode(data.toJson());

class CarItem {
  CarItem({
    this.id,
    this.carModel,
    this.logo,
    this.establishedYear,
    this.averagePrice,
    this.description,
    this.carPics,
  });

  int? id;
  String? carModel;
  String? logo;
  int? establishedYear;
  int? averagePrice;
  String? description;
  List<String>? carPics;

  factory CarItem.fromJson(Map<String, dynamic> json) => CarItem(
    id: json["id"],
    carModel: json["car_model"],
    logo: json["logo"],
    establishedYear: json["established_year"],
    averagePrice: json["average_price"],
    description: json["description"],
    carPics: List<String>.from(json["car_pics"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "logo": logo,
    "established_year": establishedYear,
    "average_price": averagePrice,
    "description": description,
    "car_pics": List<dynamic>.from(carPics!.map((x) => x)),
  };
}
