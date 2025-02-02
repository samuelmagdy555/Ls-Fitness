class ExerciseDetailsModel {
  ExerciseDetailsModel({
    required this.data,
  });
  late final Data data;

  ExerciseDetailsModel.fromJson(Map<String, dynamic> json){
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
     this.bodyPart,
    this.toolOrMachine,
    required this.Cardio,
    required this.Warmup,
    required this.recoveryAndStretching,
     this.deepAnatomy,
    required this.video,
    this.Description,
    this.instructions,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.title,
    required this.targetGender,
  });

  BodyPart? bodyPart;
  ToolOrMachine? toolOrMachine;
  late final bool Cardio;
  late final bool Warmup;
  late final bool recoveryAndStretching;
   List<DeepAnatomy>? deepAnatomy;
  late final Video video;
  String? Description;
  String? instructions;
  late final String createdAt;
  late final String updatedAt;
  late final String id;
  late final String title;
  late final String targetGender;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bodyPart'] != null) {
      bodyPart = BodyPart.fromJson(json['bodyPart']);
    }
    else {
      bodyPart = BodyPart(id: '', title: '' );
    }
    toolOrMachine = json['toolOrMachine'] != null
        ? ToolOrMachine.fromJson(json['toolOrMachine'])
        : null;
    Cardio = json['Cardio'];
    Warmup = json['Warmup'];
    recoveryAndStretching = json['recoveryAndStretching'];
    deepAnatomy = (json['deepAnatomy'] as List)
        .map((e) => DeepAnatomy.fromJson(e))
        .toList();
    video = Video.fromJson(json['video']);
    Description = json['Description'];
    instructions = json['instructions'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['_id'];
    title = json['title'];
    targetGender = json['targetGender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bodyPart'] = bodyPart?.toJson()?? BodyPart(id: '', title: '');
    _data['toolOrMachine'] = toolOrMachine?.toJson();
    _data['Cardio'] = Cardio;
    _data['Warmup'] = Warmup;
    _data['recoveryAndStretching'] = recoveryAndStretching;
    _data['deepAnatomy'] = deepAnatomy?.map((e) => e.toJson()).toList() ?? [];
    _data['video'] = video.toJson();
    _data['Description'] = Description;
    _data['instructions'] = instructions;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['_id'] = id;
    _data['title'] = title;
    _data['targetGender'] = targetGender;
    return _data;
  }
}
class DeepAnatomy {
  DeepAnatomy({
    this.id,
    this.title,
  });

   String? id;
   String? title;

  DeepAnatomy.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ??'';
    title = json['title'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id ?? '',
      'title': title ?? '',
    };
  }
}
class BodyPart {
  BodyPart({
    this.id,
    this.title,
  });
  String? id;
  String? title;

  BodyPart.fromJson(Map<String, dynamic> json){
    id = json['_id'] ?? '';
    title = json['title'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id ?? '';
    _data['title'] = title ?? '';
    return _data;
  }
}
class ToolOrMachine {
  ToolOrMachine({
     this.id,
     this.name,
  });


  String? id;

  String? name;

  ToolOrMachine.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id ?? '',
      'name': name ?? '',
    };
  }
}
class Video {
  Video({
    this.url,
    this.publicId,
    this.thumbnail,
  });
   String? url;
   int? publicId;
   String? thumbnail;

  Video.fromJson(Map<String, dynamic> json){
    url = json['url'] ?? '';
    publicId = json['public_id'] ?? 0;
    thumbnail = json['thumbnail']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url ?? '';
    _data['public_id'] = publicId ??'';
    _data['thumbnail'] = thumbnail ??'';
    return _data;
  }
}