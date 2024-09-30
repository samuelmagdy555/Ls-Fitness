class ProfileModel {
  ProfileModel({
    required this.data,
  });
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
    required this.password,
    required this.isOAuthUser,
    required this.phone,
    required this.role,
    required this.active,
    required this.v,
  });

  late final String id;
  late final String username;
  late final String email;
  late final String password;
  late final bool isOAuthUser;
  late final String phone;
  late final String role;
  late final bool active;
  late final int v;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isOAuthUser = json['isOAuthUser'];
    phone = json['phone'];
    role = json['role'];
    active = json['active'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['isOAuthUser'] = isOAuthUser;
    _data['phone'] = phone;
    _data['role'] = role;
    _data['active'] = active;
    _data['__v'] = v;
    return _data;
  }
}
