class Meal {
  String name;
  String time;
  int id = 0;

  Meal({required this.name, required this.time , required this.id});

  // لتحويل الموديل إلى JSON
  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
    };
  }

  // لتحويل JSON إلى موديل
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']),
    );
  }
}