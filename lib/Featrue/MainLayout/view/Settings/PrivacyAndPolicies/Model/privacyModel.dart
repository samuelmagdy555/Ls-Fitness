class PrivacyModel {
  PrivacyModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  PrivacyModel.fromJson(Map<String, dynamic> json){
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
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
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final String content;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}