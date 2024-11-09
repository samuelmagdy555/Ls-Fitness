class FoodCalculatorFilterModel {
  FoodCalculatorFilterModel({
    required this.results,
    required this.totlaCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totlaCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  FoodCalculatorFilterModel.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as num).toInt(); // Cast to num first to handle double and int
    totlaCount = (json['totlaCount'] as num).toInt();
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totlaCount'] = totlaCount;
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
  });
  late final int currentPage;
  late final int limit;
  late final int numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = (json['currentPage'] as num).toInt();
    limit = (json['limit'] as num).toInt();
    numberOfPages = (json['numberOfPages'] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['limit'] = limit;
    _data['numberOfPages'] = numberOfPages;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.TitleAR,
    required this.TitleEN,
  });
  late final String id;
  late final String TitleAR;
  late final String TitleEN;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    TitleAR = json['Title_AR'];
    TitleEN = json['Title_EN'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Title_AR'] = TitleAR;
    _data['Title_EN'] = TitleEN;
    return _data;
  }
}
