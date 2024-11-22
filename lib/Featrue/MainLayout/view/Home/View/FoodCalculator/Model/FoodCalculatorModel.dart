class FoodCalculatorModel {
  FoodCalculatorModel({
    required this.results,
    required this.data,
  });

  late final int results;
  late final List<Data> data;

  FoodCalculatorModel.fromJson(Map<String, dynamic> json) {
    results = json['results'] ?? 0; // قيمة افتراضية 0 إذا كانت null
    data = (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList() ??
        []; // قيمة افتراضية قائمة فارغة إذا كانت null
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.mealCategory,
    required this.image,
    required this.TitleAR,
    required this.TitleEN,
    required this.quantities,
    required this.Calories,
    required this.Protein,
    required this.Carbohydrates,
    required this.Fats,
    required this.Fiber,
    required this.Sugar,
    required this.VitaminA,
    required this.VitaminB1,
    required this.VitaminB2,
    required this.VitaminB3,
    required this.VitaminB5,
    required this.VitaminB6,
    required this.VitaminB7,
    required this.VitaminB9,
    required this.VitaminB12,
    required this.VitaminC,
    required this.VitaminD,
    required this.VitaminE,
    required this.VitaminK,
    required this.Calcium,
    required this.Iron,
    required this.Magnesium,
    required this.Phosphorus,
    required this.Potassium,
    required this.Sodium,
    required this.Zinc,
    required this.Copper,
    required this.Manganese,
    required this.Selenium,
  });

  late final String id;
  late final MealCategory mealCategory;
  var image;
  var TitleAR;
  var TitleEN;
  var quantities;
  var Calories;
  var Protein;
  var Carbohydrates;
  var Fats;
  var Fiber;
  var Sugar;
  var VitaminA;
  var VitaminB1;
  var VitaminB2;
  var VitaminB3;
  var VitaminB5;
  var VitaminB6;
  var VitaminB7;
  var VitaminB9;
  var VitaminB12;
  var VitaminC;
  var VitaminD;
  var VitaminE;
  var VitaminK;
  var Calcium;
  var Iron;
  var Magnesium;
  var Phosphorus;
  var Potassium;
  var Sodium;
  var Zinc;
  var Copper;
  var Manganese;
  var Selenium;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? ''; // قيمة افتراضية نص فارغ
    mealCategory = json['mealCategory'] != null
        ? MealCategory.fromJson(json['mealCategory'])
        : throw Exception('mealCategory لا يمكن أن تكون null');
    image = json['image'] ?? '';
    TitleAR = json['Title_AR'] ?? '';
    TitleEN = json['Title_EN'] ?? '';
    quantities = json['quantities'] ?? 0;
    Calories = json['Calories'] ?? 0;
    Protein = json['Protein'] ?? 0;
    Carbohydrates = json['Carbohydrates'] ?? 0;
    Fats = json['Fats'] ?? 0;
    Fiber = json['Fiber'] ?? 0;
    Sugar = json['Sugar'] ?? 0;
    VitaminA = json['Vitamin_A'] ?? 0;
    VitaminB1 = json['Vitamin_B1'] ?? 0;
    VitaminB2 = json['Vitamin_B2'] ?? 0;
    VitaminB3 = json['Vitamin_B3'] ?? 0;
    VitaminB5 = json['Vitamin_B5'] ?? 0;
    VitaminB6 = json['Vitamin_B6'] ?? 0;
    VitaminB7 = json['Vitamin_B7'] ?? 0;
    VitaminB9 = json['Vitamin_B9'] ?? 0;
    VitaminB12 = json['Vitamin_B12'] ?? 0;
    VitaminC = json['Vitamin_C'] ?? 0;
    VitaminD = json['Vitamin_D'] ?? 0;
    VitaminE = json['Vitamin_E'] ?? 0;
    VitaminK = json['Vitamin_K'] ?? 0;
    Calcium = json['Calcium'] ?? 0;
    Iron = json['Iron'] ?? 0;
    Magnesium = json['Magnesium'] ?? 0;
    Phosphorus = json['Phosphorus'] ?? 0;
    Potassium = json['Potassium'] ?? 0;
    Sodium = json['Sodium'] ?? 0;
    Zinc = json['Zinc'] ?? 0;
    Copper = json['Copper'] ?? 0;
    Manganese = json['Manganese'] ?? 0;
    Selenium = json['Selenium'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['mealCategory'] = mealCategory.toJson();
    _data['image'] = image;
    _data['Title_AR'] = TitleAR;
    _data['Title_EN'] = TitleEN;
    _data['quantities'] = quantities;
    _data['Calories'] = Calories;
    _data['Protein'] = Protein;
    _data['Carbohydrates'] = Carbohydrates;
    _data['Fats'] = Fats;
    _data['Fiber'] = Fiber;
    _data['Sugar'] = Sugar;
    _data['Vitamin_A'] = VitaminA;
    _data['Vitamin_B1'] = VitaminB1;
    _data['Vitamin_B2'] = VitaminB2;
    _data['Vitamin_B3'] = VitaminB3;
    _data['Vitamin_B5'] = VitaminB5;
    _data['Vitamin_B6'] = VitaminB6;
    _data['Vitamin_B7'] = VitaminB7;
    _data['Vitamin_B9'] = VitaminB9;
    _data['Vitamin_B12'] = VitaminB12;
    _data['Vitamin_C'] = VitaminC;
    _data['Vitamin_D'] = VitaminD;
    _data['Vitamin_E'] = VitaminE;
    _data['Vitamin_K'] = VitaminK;
    _data['Calcium'] = Calcium;
    _data['Iron'] = Iron;
    _data['Magnesium'] = Magnesium;
    _data['Phosphorus'] = Phosphorus;
    _data['Potassium'] = Potassium;
    _data['Sodium'] = Sodium;
    _data['Zinc'] = Zinc;
    _data['Copper'] = Copper;
    _data['Manganese'] = Manganese;
    _data['Selenium'] = Selenium;
    return _data;
  }
}

class MealCategory {
  MealCategory({
    required this.id,
    required this.TitleAR,
    required this.TitleEN,
  });

  late final String id;
  late final String TitleAR;
  late final String TitleEN;

  MealCategory.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    TitleAR = json['Title_AR'] ?? '';
    TitleEN = json['Title_EN'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Title_AR'] = TitleAR;
    _data['Title_EN'] = TitleEN;
    return _data;
  }
}
