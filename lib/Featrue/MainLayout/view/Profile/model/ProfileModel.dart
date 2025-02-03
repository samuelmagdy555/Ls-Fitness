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
    required this.deviceIds,
    required this.isOAuthUser,
    required this.role,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.profileImg,
  });
  late final GoalsData goalsData;
  late final String id;
  late final String username;
  late final String email;
  late final String phone;
  late final List<String> deviceIds;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final String createdAt;
  late final String updatedAt;
  late final Null profileImg;

  Data.fromJson(Map<String, dynamic> json){
    goalsData = GoalsData.fromJson(json['goalsData']);
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    deviceIds = List.castFrom<dynamic, String>(json['deviceIds']);
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileImg = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['goalsData'] = goalsData.toJson();
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['deviceIds'] = deviceIds;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['profileImg'] = profileImg;
    return _data;
  }
}

class GoalsData {
  GoalsData({
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.address,
    required this.nationality,
    required this.walkDaily,
    required this.workRoutine,
    required this.bodyDimensions,
    required this.fitnessLevel,
    required this.mainGoal,
    required this.allergicSubstances,
    required this.injuries,
    required this.exercisePreference,
    required this.trainingNumberDays,
    required this.trainingDays,
    required this.diets,
    required this.targetWeight,
    required this.fitnessEquipment,
    required this.trainingTime,
    required this.hearUs,
    required this.locationOfTraining,
    required this.experienceIssues,
    required this.trainingBreak,
  });
  late final int age;
  late final String gender;
  late final String weight;
  late final String height;
  late final String address;
  late final String nationality;
  late final String walkDaily;
  late final String workRoutine;
  late final List<BodyDimensions> bodyDimensions;
  late final String fitnessLevel;
  late final String mainGoal;
  late final String allergicSubstances;
  late final List<String> injuries;
  late final String exercisePreference;
  late final String trainingNumberDays;
  late final List<String> trainingDays;
  late final String diets;
  late final String targetWeight;
  late final String fitnessEquipment;
  late final String trainingTime;
  late final String hearUs;
  late final String locationOfTraining;
  late final String experienceIssues;
  late final String trainingBreak;

  GoalsData.fromJson(Map<String, dynamic> json){
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    address = json['address'];
    nationality = json['nationality'];
    walkDaily = json['walkDaily'];
    workRoutine = json['workRoutine'];
    bodyDimensions = List.from(json['bodyDimensions']).map((e)=>BodyDimensions.fromJson(e)).toList();
    fitnessLevel = json['fitnessLevel'];
    mainGoal = json['mainGoal'];
    allergicSubstances = json['allergicSubstances'];
    injuries = List.castFrom<dynamic, String>(json['injuries']);
    exercisePreference = json['exercisePreference'];
    trainingNumberDays = json['trainingNumberDays'];
    trainingDays = List.castFrom<dynamic, String>(json['trainingDays']);
    diets = json['diets'];
    targetWeight = json['targetWeight'];
    fitnessEquipment = json['fitnessEquipment'];
    trainingTime = json['trainingTime'];
    hearUs = json['hearUs'];
    locationOfTraining = json['locationOfTraining'];
    experienceIssues = json['experienceIssues'];
    trainingBreak = json['trainingBreak'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['gender'] = gender;
    _data['weight'] = weight;
    _data['height'] = height;
    _data['address'] = address;
    _data['nationality'] = nationality;
    _data['walkDaily'] = walkDaily;
    _data['workRoutine'] = workRoutine;
    _data['bodyDimensions'] = bodyDimensions.map((e)=>e.toJson()).toList();
    _data['fitnessLevel'] = fitnessLevel;
    _data['mainGoal'] = mainGoal;
    _data['allergicSubstances'] = allergicSubstances;
    _data['injuries'] = injuries;
    _data['exercisePreference'] = exercisePreference;
    _data['trainingNumberDays'] = trainingNumberDays;
    _data['trainingDays'] = trainingDays;
    _data['diets'] = diets;
    _data['targetWeight'] = targetWeight;
    _data['fitnessEquipment'] = fitnessEquipment;
    _data['trainingTime'] = trainingTime;
    _data['hearUs'] = hearUs;
    _data['locationOfTraining'] = locationOfTraining;
    _data['experienceIssues'] = experienceIssues;
    _data['trainingBreak'] = trainingBreak;
    return _data;
  }
}

class BodyDimensions {
  BodyDimensions({
    required this.measurement,
    required this.value,
    required this.id,
  });
  late final String measurement;
  late final String value;
  late final String id;

  BodyDimensions.fromJson(Map<String, dynamic> json){
    measurement = json['measurement'];
    value = json['value'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['measurement'] = measurement;
    _data['value'] = value;
    _data['_id'] = id;
    return _data;
  }
}