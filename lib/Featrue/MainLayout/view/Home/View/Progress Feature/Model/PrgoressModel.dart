class ProgressModel {
  ProgressModel({
    this.results,
    this.totalCount,
    this.paginationResult,
    this.data,
  });

  late int? results;
  late int? totalCount;
  late PaginationResult? paginationResult;
  late List<Data>? data;

  ProgressModel.fromJson(Map<String, dynamic>? json) {
    results = json?['results'];
    totalCount = json?['totalCount'];
    paginationResult = json?['paginationResult'] != null ? PaginationResult.fromJson(json!['paginationResult']) : null;
    data = json?['data'] != null ? List.from(json!['data']).map((e) => Data.fromJson(e)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results;
    data['totalCount'] = totalCount;
    data['paginationResult'] = paginationResult?.toJson();
    data['data'] = this.data?.map((e) => e.toJson()).toList();
    return data;
  }
}

class PaginationResult {
  PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
  });

  late int? currentPage;
  late int? limit;
  late int? numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic>? json) {
    currentPage = json?['currentPage'];
    limit = json?['limit'];
    numberOfPages = json?['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['numberOfPages'] = numberOfPages;
    return data;
  }
}

class Data {
  Data({
    this.id,
    this.userId,
    this.volumes,
    this.createdAt,
    this.updatedAt,
    this.exercise,
  });

  late String? id;
  late UserId? userId;
  late List<Volumes>? volumes;
  late String? createdAt;
  late String? updatedAt;
  late Exercise? exercise;

  Data.fromJson(Map<String, dynamic>? json) {
    id = json?['_id'];
    userId = json?['userId'] != null ? UserId.fromJson(json!['userId']) : null;
    volumes = json?['volumes'] != null ? List.from(json!['volumes']).map((e) => Volumes.fromJson(e)).toList() : null;
    createdAt = json?['createdAt'];
    updatedAt = json?['updatedAt'];
    exercise = json?['exercise'] != null ? Exercise.fromJson(json!['exercise']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['userId'] = userId?.toJson();
    data['volumes'] = volumes?.map((e) => e.toJson()).toList();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['exercise'] = exercise?.toJson();
    return data;
  }
}

class UserId {
  UserId({
    this.id,
    this.username,
  });

  late String? id;
  late String? username;

  UserId.fromJson(Map<String, dynamic>? json) {
    id = json?['_id'];
    username = json?['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    return data;
  }
}

class Volumes {
  Volumes({
    this.volume,
    this.date,
    this.id,
  });

  late int? volume;
  late String? date;
  late String? id;

  Volumes.fromJson(Map<String, dynamic>? json) {
    volume = json?['volume'];
    date = json?['date'];
    id = json?['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['volume'] = volume;
    data['date'] = date;
    data['_id'] = id;
    return data;
  }
}

class Exercise {
  Exercise({
    this.id,
    this.title,
  });

  late String? id;
  late String? title;

  Exercise.fromJson(Map<String, dynamic>? json) {
    id = json?['_id'];
    title = json?['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    return data;
  }
}