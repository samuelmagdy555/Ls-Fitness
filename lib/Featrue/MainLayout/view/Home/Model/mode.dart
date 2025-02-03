class AdvertiseModel {
  AdvertiseModel({
     this.results,
     this.totalCount,
     this.paginationResult,
    required this.data,
  });

   int? results;
   int? totalCount;
   PaginationResult? paginationResult;
  late final List<Data> data;

  AdvertiseModel.fromJson(Map<String, dynamic> json) {
    results = json['results'] ?? 0;
    totalCount = json['totalCount'] ?? 0;
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;  // Handle null case properly
    data = json['data'] != null
        ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
        : []; // Return an empty list instead of null
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    if (paginationResult != null) {
      _data['paginationResult'] = paginationResult!.toJson();
    }else{
      _data['paginationResult'] = PaginationResult(currentPage: 0, limit: 0, numberOfPages: 0);
    }
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
    currentPage = json['currentPage'] ?? 1;
    limit = json['limit'] ?? 10;
    numberOfPages = json['numberOfPages'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'limit': limit,
      'numberOfPages': numberOfPages,
    };
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.image,
    required this.targetModel,
    required this.targetModelId,
    required this.createdAt,
    required this.updatedAt,
  });

  late final String id;
  late final String title;
  late final String image;
  late final String targetModel;
  late final String targetModelId;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    title = json['title'] ?? '';
    image = json['image'] ?? '';
    targetModel = json['targetModel'] ?? '';
    targetModelId = json['targetModelId'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
      'targetModel': targetModel,
      'targetModelId': targetModelId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
