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
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String phone;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}