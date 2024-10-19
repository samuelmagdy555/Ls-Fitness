class Workout {
  String name;
  String time;
  int id = 0;

  Workout({required this.name, required this.time , required this.id});

  // لتحويل الموديل إلى JSON
  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
    };
  }

  // لتحويل JSON إلى موديل
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']),
    );
  }
}