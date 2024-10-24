class ExerciseDetailsModel {
  ExerciseDetailsModel({
    required this.data,
  });
  late final Data data;

  ExerciseDetailsModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.targetGender,
    required this.category,
    required this.bodyPart,
    required this.url,
    required this.publicId,
  });
  late final String id;
  late final String title;
  late final String targetGender;
  late final Category category;
  late final BodyPart bodyPart;
  late final String url;
  late final String publicId;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    targetGender = json['targetGender'];
    category = Category.fromJson(json['category']);
    bodyPart = BodyPart.fromJson(json['bodyPart']);
    url = json['url'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['targetGender'] = targetGender;
    _data['category'] = category.toJson();
    _data['bodyPart'] = bodyPart.toJson();
    _data['url'] = url;
    _data['public_id'] = publicId;
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