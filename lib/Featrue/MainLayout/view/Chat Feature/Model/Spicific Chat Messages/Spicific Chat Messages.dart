class SpecificChatMessages {
  SpecificChatMessages({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  SpecificChatMessages.fromJson(Map<String, dynamic> json){
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    _data['paginationResult'] = paginationResult.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PaginationResult {
  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });
  late final int currentPage;
  late final int limit;
  late final int numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['limit'] = limit;
    _data['numberOfPages'] = numberOfPages;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.chat,
    required this.sender,
    required this.text,
    required this.media,
    required this.isRead,
    required this.seendBy,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String chat;
  late final Sender sender;
  late final String text;
  late final List<dynamic> media;
  late final bool isRead;
  late final List<dynamic> seendBy;
  late final List<dynamic> reactions;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    chat = json['chat'];
    sender = Sender.fromJson(json['sender']);
    text = json['text'];
    media = List.castFrom<dynamic, dynamic>(json['media']);
    isRead = json['isRead'];
    seendBy = List.castFrom<dynamic, dynamic>(json['seendBy']);
    reactions = List.castFrom<dynamic, dynamic>(json['reactions']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['chat'] = chat;
    _data['sender'] = sender.toJson();
    _data['text'] = text;
    _data['media'] = media;
    _data['isRead'] = isRead;
    _data['seendBy'] = seendBy;
    _data['reactions'] = reactions;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Sender {
  Sender({
    required this.id,
    required this.username,
    this.profileImg,
  });
  late final String id;
  late final String username;
  late final Null profileImg;

  Sender.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    profileImg = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['profileImg'] = profileImg;
    return _data;
  }
}