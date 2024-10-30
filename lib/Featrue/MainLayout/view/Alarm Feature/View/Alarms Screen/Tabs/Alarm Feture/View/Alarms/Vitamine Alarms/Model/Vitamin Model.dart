class Vitamin {
  String name;
  String time;
  int id = 0;

  Vitamin({required this.name, required this.time , required this.id});

  // لتحويل الموديل إلى JSON
  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
    };
  }

  factory Vitamin.fromJson(Map<String, dynamic> json) {
    return Vitamin(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']),
    );
  }
}