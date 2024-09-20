class RegisterModel {
  RegisterModel({
    required this.data,
    required this.token,
  });

  late final Data data;
  late final String token;

  // Deserialize JSON
  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    token = json['token'];
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.password,
    required this.isOAuthUser,
    required this.phone,
    required this.role,
    required this.active,
    required this.id,
    required this.v,
  });

  late final String username;
  late final String email;
  late final String password;
  late final bool isOAuthUser;
  late final String phone;
  late final String role;
  late final bool active;
  late final String id;  // Renamed from _id to id
  late final int v;      // Renamed from _V to v

  // Deserialize JSON
  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isOAuthUser = json['isOAuthUser'];
    phone = json['phone'];
    role = json['role'];
    active = json['active'];
    id = json['_id'];   // Map _id field to id
    v = json['__v'];    // Map __v field to v
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['isOAuthUser'] = isOAuthUser;
    _data['phone'] = phone;
    _data['role'] = role;
    _data['active'] = active;
    _data['_id'] = id;   // Map id to _id in JSON
    _data['__v'] = v;    // Map v to __v in JSON
    return _data;
  }
}
