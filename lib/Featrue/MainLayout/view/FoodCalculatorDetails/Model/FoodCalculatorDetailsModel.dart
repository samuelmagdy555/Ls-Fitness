class FoodCalculatorDetailsModel {
  FoodCalculatorDetailsModel({
    required this.data,
  });
  late final Data data;

  FoodCalculatorDetailsModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.calculationData,
  });
  late final String id;
  late final String title;
  late final CalculationData calculationData;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    calculationData = CalculationData.fromJson(json['calculationData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['calculationData'] = calculationData.toJson();
    return _data;
  }
}

class CalculationData {
  CalculationData({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.fibers,
  });
  late final int calories;
  late final int protein;
  late final int carbs;
  late final int fats;
  late final int fibers;

  CalculationData.fromJson(Map<String, dynamic> json){
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fats = json['fats'];
    fibers = json['fibers'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['calories'] = calories;
    _data['protein'] = protein;
    _data['carbs'] = carbs;
    _data['fats'] = fats;
    _data['fibers'] = fibers;
    return _data;
  }
}