// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

import 'dart:convert';

Cars carsFromJson(String str) => Cars.fromJson(json.decode(str));

String carsToJson(Cars data) => json.encode(data.toJson());

class Cars {
  Cars({
    this.data,
  });

  List<Datum>? data;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.carModel,
    this.averagePrice,
    this.logo,
    this.establishedYear,
  });

  int? id;
  String? carModel;
  int? averagePrice;
  String? logo;
  int? establishedYear;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    carModel: json["car_model"],
    averagePrice: json["average_price"],
    logo: json["logo"],
    establishedYear: json["established_year"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "average_price": averagePrice,
    "logo": logo,
    "established_year": establishedYear,
  };
}
