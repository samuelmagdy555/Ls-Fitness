class SpecificCourseLessonModel {
  SpecificCourseLessonModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });

  final int? results;
  final int? totalCount;
  final PaginationResult? paginationResult;
  final List<Datum> data;

  factory SpecificCourseLessonModel.fromJson(Map<String, dynamic> json){
    return SpecificCourseLessonModel(
      results: json["results"],
      totalCount: json["totalCount"],
      paginationResult: json["paginationResult"] == null ? null : PaginationResult.fromJson(json["paginationResult"]),
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "results": results,
    "totalCount": totalCount,
    "paginationResult": paginationResult?.toJson(),
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.course,
    required this.type,
    required this.image,
    required this.videoUrl,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.video,
  });

  final String? id;
  final String? title;
  final Course? course;
  final String? type;
  final String? image;
  final String? videoUrl;
  final String? attachment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Video? video;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["_id"],
      title: json["title"],
      course: json["course"] == null ? null : Course.fromJson(json["course"]),
      type: json["type"],
      image: json["image"],
      videoUrl: json["videoUrl"],
      attachment: json["attachment"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      video: json["video"] == null ? null : Video.fromJson(json["video"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "course": course?.toJson(),
    "type": type,
    "image": image,
    "videoUrl": videoUrl,
    "attachment": attachment,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "video": video?.toJson(),
  };

}

class Course {
  Course({
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  factory Course.fromJson(Map<String, dynamic> json){
    return Course(
      id: json["_id"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };

}

class Video {
  Video({
    required this.url,
    required this.publicId,
    required this.thumbnail,
  });

  final String? url;
  final int? publicId;
  final String? thumbnail;

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      url: json["url"],
      publicId: json["public_id"],
      thumbnail: json["thumbnail"],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
    "thumbnail": thumbnail,
  };

}

class PaginationResult {
  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });

  final int? currentPage;
  final int? limit;
  final int? numberOfPages;

  factory PaginationResult.fromJson(Map<String, dynamic> json){
    return PaginationResult(
      currentPage: json["currentPage"],
      limit: json["limit"],
      numberOfPages: json["numberOfPages"],
    );
  }

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "limit": limit,
    "numberOfPages": numberOfPages,
  };

}
