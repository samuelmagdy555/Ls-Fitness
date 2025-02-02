class ProfileModel {
  ProfileModel({
    required this.data,
  });
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json){
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
    required this.goalsData,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.isOAuthUser,
    required this.role,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.age,
    required this.gender,
    required this.length,
    required this.targetWeight,
    required this.weight,
    required this.passwordResetVerified,
    required this.deviceIds,
    this.profileImg,
  });
  late final GoalsData goalsData;
  late final String id;
  late final String username;
  late final String email;
  late final String phone;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final String createdAt;
  late final String updatedAt;
  late final int age;
  late final String gender;
  late final String length;
  late final String targetWeight;
  late final String weight;
  late final bool passwordResetVerified;
  late final List<String> deviceIds;
  late final Null profileImg;

  Data.fromJson(Map<String, dynamic> json){
    goalsData = GoalsData.fromJson(json['goalsData']);
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    age = json['age'];
    gender = json['gender'];
    length = json['length'];
    targetWeight = json['targetWeight'];
    weight = json['weight'];
    passwordResetVerified = json['passwordResetVerified'];
    deviceIds = List.castFrom<dynamic, String>(json['deviceIds']);
    profileImg = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['goalsData'] = goalsData.toJson();
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['length'] = length;
    _data['targetWeight'] = targetWeight;
    _data['weight'] = weight;
    _data['passwordResetVerified'] = passwordResetVerified;
    _data['deviceIds'] = deviceIds;
    _data['profileImg'] = profileImg;
    return _data;
  }
}

class GoalsData {
  GoalsData({
    required this.injuries,
    required this.trainingDays,
    required this.bodyDimensions,
  });
  late final List<dynamic> injuries;
  late final List<dynamic> trainingDays;
  late final List<dynamic> bodyDimensions;

  GoalsData.fromJson(Map<String, dynamic> json){
    injuries = List.castFrom<dynamic, dynamic>(json['injuries']);
    trainingDays = List.castFrom<dynamic, dynamic>(json['trainingDays']);
    bodyDimensions = List.castFrom<dynamic, dynamic>(json['bodyDimensions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['injuries'] = injuries;
    _data['trainingDays'] = trainingDays;
    _data['bodyDimensions'] = bodyDimensions;
    return _data;
  }
}