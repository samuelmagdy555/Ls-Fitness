class Sleep {
  String name;
  String time;
  int id = 0;

  Sleep({required this.name, required this.time , required this.id});

  // لتحويل الموديل إلى JSON
  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
    };
  }

  // لتحويل JSON إلى موديل
  factory Sleep.fromJson(Map<String, dynamic> json) {
    return Sleep(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']),
    );
  }
}