class FoodCalculatorModel {
  FoodCalculatorModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  FoodCalculatorModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    _data['paginationResult'] = paginationResult.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PaginationResult {
  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
    required this.nextPage,
  });
  late final int currentPage;
  late final int limit;
  late final int numberOfPages;
  late final int nextPage;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['limit'] = limit;
    _data['numberOfPages'] = numberOfPages;
    _data['nextPage'] = nextPage;
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
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final MealCategory mealCategory;
  late final String image;
  late final String TitleAR;
  late final String TitleEN;
  late final int quantities;
  late final int Calories;
  late final double? Protein;
  late final double? Carbohydrates;
  late final double? Fats;
  late final double? Fiber;
  late final double? Sugar;
  late final double? VitaminA;
  late final double VitaminB1;
  late final double VitaminB2;
  late final double VitaminB3;
  late final double? VitaminB5;
  late final double VitaminB6;
  late final double? VitaminB7;
  late final double? VitaminB9;
  late final int VitaminB12;
  late final double? VitaminC;
  late final int VitaminD;
  late final double? VitaminE;
  late final double? VitaminK;
  late final int Calcium;
  late final double Iron;
  late final int Magnesium;
  late final int Phosphorus;
  late final int Potassium;
  late final int Sodium;
  late final double Zinc;
  late final double Copper;
  late final double Manganese;
  late final double? Selenium;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    mealCategory = MealCategory.fromJson(json['mealCategory']);
    image = json['image'];
    TitleAR = json['Title_AR'];
    TitleEN = json['Title_EN'];

    // Handle the fields where a double might be passed
    quantities = (json['quantities'] is int) ? json['quantities'] : (json['quantities'] as double).toInt();
    Calories = (json['Calories'] is int) ? json['Calories'] : (json['Calories'] as double).toInt();

    // For fields that can be either int or double, handle accordingly
    Protein = json['Protein'] is double ? json['Protein'] : (json['Protein'] as int).toDouble();
    Carbohydrates = json['Carbohydrates'] is double ? json['Carbohydrates'] : (json['Carbohydrates'] as int).toDouble();
    Fats = json['Fats'] is double ? json['Fats'] : (json['Fats'] as int).toDouble();
    Fiber = json['Fiber'] is double ? json['Fiber'] : (json['Fiber'] as int).toDouble();
    Sugar = json['Sugar'] is double ? json['Sugar'] : (json['Sugar'] as int).toDouble();
    VitaminA = json['Vitamin_A'] is double ? json['Vitamin_A'] : (json['Vitamin_A'] as int).toDouble();

    VitaminB1 = json['Vitamin_B1'].toDouble();
    VitaminB2 = json['Vitamin_B2'].toDouble();
    VitaminB3 = json['Vitamin_B3'].toDouble();
    VitaminB5 = json['Vitamin_B5']?.toDouble(); // nullable
    VitaminB6 = json['Vitamin_B6'].toDouble();
    VitaminB7 = json['Vitamin_B7']?.toDouble(); // nullable
    VitaminB9 = json['Vitamin_B9']?.toDouble(); // nullable
    VitaminB12 = json['Vitamin_B12'] is int ? json['Vitamin_B12'] : (json['Vitamin_B12'] as double).toInt();

    VitaminC = json['Vitamin_C'] is double ? json['Vitamin_C'] : (json['Vitamin_C'] as int).toDouble();
    VitaminD = json['Vitamin_D'] is int ? json['Vitamin_D'] : (json['Vitamin_D'] as double).toInt();
    VitaminE = json['Vitamin_E'] is double ? json['Vitamin_E'] : (json['Vitamin_E'] as int).toDouble();
    VitaminK = json['Vitamin_K'] is double ? json['Vitamin_K'] : (json['Vitamin_K'] as int).toDouble();

    Calcium = json['Calcium'] is int ? json['Calcium'] : (json['Calcium'] as double).toInt();
    Iron = json['Iron'] is double ? json['Iron'] : (json['Iron'] as int).toDouble();
    Magnesium = json['Magnesium'] is int ? json['Magnesium'] : (json['Magnesium'] as double).toInt();
    Phosphorus = json['Phosphorus'] is int ? json['Phosphorus'] : (json['Phosphorus'] as double).toInt();
    Potassium = json['Potassium'] is int ? json['Potassium'] : (json['Potassium'] as double).toInt();
    Sodium = json['Sodium'] is int ? json['Sodium'] : (json['Sodium'] as double).toInt();
    Zinc = json['Zinc'] is double ? json['Zinc'] : (json['Zinc'] as int).toDouble();
    Copper = json['Copper'] is double ? json['Copper'] : (json['Copper'] as int).toDouble();
    Manganese = json['Manganese'] is double ? json['Manganese'] : (json['Manganese'] as int).toDouble();
    Selenium = json['Selenium'] is double ? json['Selenium'] : (json['Selenium'] as int?)?.toDouble();

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class MealCategory {
  MealCategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String createdAt;
  late final String updatedAt;

  MealCategory.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
