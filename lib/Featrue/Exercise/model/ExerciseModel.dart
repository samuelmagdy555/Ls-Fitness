class ExerciseModel {
  ExerciseModel({
    required this.results,
    required this.totlaCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totlaCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  ExerciseModel.fromJson(Map<String, dynamic> json){
    results = json['results'];
    totlaCount = json['totlaCount'];
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totlaCount'] = totlaCount;
    _data['paginationResult'] = paginationResult.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
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

  PaginationResult.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
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
    required this.title,
    required this.category,
    required this.bodyPart,
    required this.targetGender,
    required this.videoUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final Category category;
  late final BodyPart bodyPart;
  late final String targetGender;
  late final String videoUrl;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    category = Category.fromJson(json['category']);
    bodyPart = BodyPart.fromJson(json['bodyPart']);
    targetGender = json['targetGender'];
    videoUrl = json['videoUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['category'] = category.toJson();
    _data['bodyPart'] = bodyPart.toJson();
    _data['targetGender'] = targetGender;
    _data['videoUrl'] = videoUrl;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.title,
  });
  late final String id;
  late final String title;

  Category.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    return _data;
  }
}

class BodyPart {
  BodyPart({
    required this.id,
    required this.title,
  });
  late final String id;
  late final String title;

  BodyPart.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    return _data;
  }
}