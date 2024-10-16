class FoodCalculatorModel {
  FoodCalculatorModel({
    required this.data,
  });
  late final List<Data> data;

  FoodCalculatorModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.quantities,
    required this.calories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    required this.fibers,
  });
  late final String id;
  late final String title;
  late final int quantities;
  late final int calories;
  late final int? proteins;
  late final int? carbohydrates;
  late final int? fats;
  late final int? fibers;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    quantities = (json['quantities'] as num).toInt();  // Safely convert to int
    calories = (json['calories'] as num).toInt();      // Safely convert to int
    proteins = (json['proteins'] != null) ? (json['proteins'] as num).toInt() : null;  // Convert if not null
    carbohydrates = (json['carbohydrates'] != null) ? (json['carbohydrates'] as num).toInt() : null;
    fats = (json['fats'] != null) ? (json['fats'] as num).toInt() : null;
    fibers = (json['fibers'] != null) ? (json['fibers'] as num).toInt() : null;
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['quantities'] = quantities;
    _data['calories'] = calories;
    _data['proteins'] = proteins;
    _data['carbohydrates'] = carbohydrates;
    _data['fats'] = fats;
    _data['fibers'] = fibers;
    return _data;
  }
}