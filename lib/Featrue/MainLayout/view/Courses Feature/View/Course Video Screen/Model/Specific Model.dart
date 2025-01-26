//SpecificLesson
class SpecificLesson {
  final Data? data;

  SpecificLesson({this.data});

  factory SpecificLesson.fromJson(Map<String, dynamic> json) {
    return SpecificLesson(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final VideoData? video;
  final String? id;
  final String? title;
  final CourseData? course;
  final String? type;
  final String? image;
  final String? attachment;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.video,
    this.id,
    this.title,
    this.course,
    this.type,
    this.image,
    this.attachment,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      video: json['video'] != null ? VideoData.fromJson(json['video']) : null,
      id: json['_id'],
      title: json['title'],
      course: json['course'] != null ? CourseData.fromJson(json['course']) : null,
      type: json['type'],
      image: json['image'],
      attachment: json['attachment'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class VideoData {
  final String? url;
  final int? publicId;
  final String? thumbnail;

  VideoData({
    this.url,
    this.publicId,
    this.thumbnail,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      url: json['url'],
      publicId: json['public_id'],
      thumbnail: json['thumbnail'],
    );
  }
}

class CourseData {
  final String? id;
  final String? title;
  final Map<String, dynamic> category;

  CourseData({
    this.id,
    this.title,
    required this.category,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      id: json['_id'],
      title: json['title'],
      category: json['category'] ?? {},
    );
  }
}
