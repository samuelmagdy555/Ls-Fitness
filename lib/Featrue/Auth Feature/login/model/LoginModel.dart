class LoginModel {
  LoginModel({
    required this.data,
    required this.token,
  });

  final Data data;
  final String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: Data.fromJson(json['data']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.email,
    required this.isOAuthUser,
    required this.phone,
    required this.role,
    required this.active,
  });

  final String id;
  final String username;
  final String email;
  final bool isOAuthUser;
  final String phone;
  final String role;
  final bool active;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      isOAuthUser: json['isOAuthUser'],
      phone: json['phone'],
      role: json['role'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['isOAuthUser'] = isOAuthUser;
    _data['phone'] = phone;
    _data['role'] = role;
    _data['active'] = active;
    return _data;
  }
}
