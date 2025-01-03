class SpecificChatMessages {
  SpecificChatMessages({
    this.results,
    this.totalCount,
    this.paginationResult,
    this.chats,
  });
  late final int? results;
  late final int? totalCount;
  late final PaginationResult? paginationResult;
  late final List<Chats>? chats;

  SpecificChatMessages.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    chats = json['data'] != null
        ? List.from(json['data']).map((e) => Chats.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    if (paginationResult != null) {
      _data['paginationResult'] = paginationResult!.toJson();
    }
    if (chats != null) {
      _data['data'] = chats!.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PaginationResult {
  PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
  });
  late final int? currentPage;
  late final int? limit;
  late final int? numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json) {
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

class Chats {
  Chats({
    this.id,
    this.chat,
    this.sender,
    this.text,
    this.media,
    this.isRead,
    this.seendBy,
    this.reactions,
    this.createdAt,
    this.updatedAt,
  });
  late final String? id;
  late final String? chat;
  late final Sender? sender;
  late final String? text;
  late final List<dynamic>? media;
  late final bool? isRead;
  late final List<dynamic>? seendBy;
  late final List<dynamic>? reactions;
  late final String? createdAt;
  late final String? updatedAt;

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    chat = json['chat'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    text = json['text'];
    media = json['media'] != null ? List.castFrom<dynamic, dynamic>(json['media']) : null;
    isRead = json['isRead'];
    seendBy = json['seendBy'] != null ? List.castFrom<dynamic, dynamic>(json['seendBy']) : null;
    reactions = json['reactions'] != null ? List.castFrom<dynamic, dynamic>(json['reactions']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['chat'] = chat;
    if (sender != null) {
      _data['sender'] = sender!.toJson();
    }
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
    this.id,
    this.username,
    this.profileImg,
  });
  late final String? id;
  late final String? username;
  late final String? profileImg;

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['profileImg'] = profileImg;
    return _data;
  }
}
