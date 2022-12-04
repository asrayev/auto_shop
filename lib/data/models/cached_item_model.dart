

const String carTable = "car_table";

class CachedCarField {
  static const String id = "_id";
  static const String name = "name";
  static const String year = "year";
  static const String price = "price";
  static const String description = "description";
  static const String logo = "logo";
}

class CachedCar {
  final int? id;
  final String name;
  final int year;
  final int price;
  final String description;
  final String logo;


  CachedCar({
    this.id,
    required this.year,
    required this.name,
    required this.price,
    required this.description,
    required this.logo
  });

  CachedCar copyWith({
    int? id,
    int? year,
    int? price,
    String? name,
    String? description,
    String? logo
  }) =>
      CachedCar(
        id: id ?? this.id,
        year: year ?? this.year,
        name: name ?? this.name,
        price: price ?? this.price,
        description: description ?? this.description,
        logo: logo ?? this.logo
      );

  static CachedCar fromJson(Map<String, Object?> json) => CachedCar(
    id: json[CachedCarField.id] as int?,
    year: json[CachedCarField.year] as int,
    name: json[CachedCarField.name] as String,
    price: json[CachedCarField.price] as int,
    description: json[CachedCarField.description] as String,
      logo: json[CachedCarField.logo] as String
  );

  Map<String, Object?> toJson() {
    return {
      CachedCarField.id: id,
      CachedCarField.year: year,
      CachedCarField.name: name,
      CachedCarField.price: price,
      CachedCarField.description :description,
      CachedCarField.logo :logo
    };
  }

  @override
  String toString() => "ID = $id;  Year = $year;   Name = $name;  Price = $price; Description = $description; Logo = $logo";
}
