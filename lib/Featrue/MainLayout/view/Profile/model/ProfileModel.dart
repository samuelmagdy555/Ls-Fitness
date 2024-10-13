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
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.isOAuthUser,
    required this.role,
    required this.active,
    this.age,
    this.gender,
    this.length,
    this.weight,
    this.targetWeight,
    this.profileImg,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String phone;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final Null age;
  late final Null gender;
  late final Null length;
  late final Null weight;
  late final Null targetWeight;
  late final Null profileImg;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    age = null;
    gender = null;
    length = null;
    weight = null;
    targetWeight = null;
    profileImg = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['length'] = length;
    _data['weight'] = weight;
    _data['targetWeight'] = targetWeight;
    _data['profileImg'] = profileImg;
    return _data;
  }
}