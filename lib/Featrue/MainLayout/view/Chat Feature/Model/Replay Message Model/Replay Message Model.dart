import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/Model/Spicific%20Chat%20Messages/Spicific%20Chat%20Messages.dart';

class ReplayMessageModel {
  ReplayMessageModel({
    required this.data,
  });

  late final Data data;

  ReplayMessageModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Data {
  Data({
    required this.id,
    required this.chat,
    required this.sender,
    required this.text,
    required this.isRead,
    required this.seenBy,
    required this.repliedTo,
    required this.media,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });

  late final String id;
  late final String chat;
  late final TheSender sender;
  late final String text;
  late final bool isRead;
  late final List<String> seenBy;
  late final RepliedTo repliedTo;
  late final List<Media> media;
  late final List<dynamic> reactions;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    chat = json['chat'];
    sender = TheSender.fromJson(json['sender']);
    text = json['text'];
    isRead = json['isRead'];
    seenBy = List<String>.from(json['seendBy'] ?? []);
    repliedTo = RepliedTo.fromJson(json['repliedTo']);
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
    reactions = List.from(json['reactions'] ?? []);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'chat': chat,
      'sender': sender.toJson(),
      'text': text,
      'isRead': isRead,
      'seendBy': seenBy,
      'repliedTo': repliedTo.toJson(),
      'media': media.map((e) => e.toJson()).toList(),
      'reactions': reactions,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': V,
    };
  }
}

class TheSender {
  TheSender({
    required this.id,
    required this.username,
    this.profileImg,
  });

  late final String id;
  late final String username;
  late final String? profileImg;

  TheSender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'profileImg': profileImg,
    };
  }
}


