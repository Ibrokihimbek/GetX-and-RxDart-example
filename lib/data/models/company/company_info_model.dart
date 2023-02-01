class CompanyModel {
  int id;
  String carModel;
  num averagePrice;
  String logo;
  int establishedYear;

  CompanyModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompanyModel.fromJson(Map<String, Object?> jsonData) {
    return CompanyModel(
      id: jsonData['id'] as int? ?? 0,
      carModel: jsonData['car_model'] as String? ?? '',
      averagePrice: jsonData['average_price'] as num? ?? 0,
      logo: jsonData['logo'] as String? ?? '',
      establishedYear: jsonData['established_year'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return '''
      id: $id,
      carModel: $carModel,
      averagePrice: $averagePrice,
      logo: $logo,
      establishedYear: $establishedYear
      ''';
  }
}