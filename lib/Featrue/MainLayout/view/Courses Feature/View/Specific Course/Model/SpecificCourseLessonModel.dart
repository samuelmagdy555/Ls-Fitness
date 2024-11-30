class SpecificCourseLessonModel {
  int? results;
  int? totalCount;
  PaginationResult? paginationResult;
  List<Data>? data;

  SpecificCourseLessonModel(
      {this.results, this.totalCount, this.paginationResult, this.data});

  SpecificCourseLessonModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = json['paginationResult'] != null
        ? new PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    data['totalCount'] = this.totalCount;
    if (this.paginationResult != null) {
      data['paginationResult'] = this.paginationResult!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['limit'] = this.limit;
    data['numberOfPages'] = this.numberOfPages;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  Course? course;
  String? type;
  String? image;
  String? videoUrl;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  Video? video;

  Data(
      {this.sId,
        this.title,
        this.course,
        this.type,
        this.image,
        this.videoUrl,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.video});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    type = json['type'];
    image = json['image'];
    videoUrl = json['videoUrl'];
    attachment = json['attachment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    data['type'] = this.type;
    data['image'] = this.image;
    data['videoUrl'] = this.videoUrl;
    data['attachment'] = this.attachment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.video != null) {
      data['video'] = this.video!.toJson();
    }
    return data;
  }
}

class Course {
  String? sId;
  String? title;

  Course({this.sId, this.title});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class Video {
  String? url;
  int? publicId;
  String? thumbnail;

  Video({this.url, this.publicId, this.thumbnail});

  Video.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['public_id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['public_id'] = this.publicId;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
