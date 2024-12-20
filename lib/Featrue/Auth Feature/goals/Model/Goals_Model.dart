class GoalsModel {
  GoalsModel({
    required this.data,
  });
  late final Data data;

  GoalsModel.fromJson(Map<String, dynamic> json){
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
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.targetWeight,
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
    required this.fitnessEquipment,
    required this.trainingTime,
    required this.hearUs,
    required this.locationOfTraining,
    required this.experienceIssues,
    required this.trainingBreak,
  });
  late final int age;
  late final String gender;
  late final String height;
  late final String weight;
  late final String targetWeight;
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
  late final String fitnessEquipment;
  late final String trainingTime;
  late final String hearUs;
  late final String locationOfTraining;
  late final String experienceIssues;
  late final String trainingBreak;

  Data.fromJson(Map<String, dynamic> json){
    age = json['age'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    targetWeight = json['targetWeight'];
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
    _data['height'] = height;
    _data['weight'] = weight;
    _data['targetWeight'] = targetWeight;
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