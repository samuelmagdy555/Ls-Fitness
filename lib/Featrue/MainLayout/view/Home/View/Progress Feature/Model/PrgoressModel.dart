class ProgressModel {
  ProgressModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final Data data;

  ProgressModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.user,
    required this.exercise,
    required this.volumes,
  });
  late final String id;
  late final User user;
  late final Exercise exercise;
  late final List<int> volumes;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    user = User.fromJson(json['user']);
    exercise = Exercise.fromJson(json['exercise']);
    volumes = List.castFrom<dynamic, int>(json['volumes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user'] = user.toJson();
    _data['exercise'] = exercise.toJson();
    _data['volumes'] = volumes;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
  });
  late final String id;
  late final String username;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    return _data;
  }
}

class Exercise {
  Exercise({
    required this.id,
    required this.title,
  });
  late final String id;
  late final String title;

  Exercise.fromJson(Map<String, dynamic> json){
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