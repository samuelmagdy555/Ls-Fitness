class DetailsTrainerProfile {
  final String id;
  final String user;
  final String name;
  final String bio;
  final int yearsOfExperience;
  final String location;
  final List<String> certificates;
  final List<Plan> plans;
  final int totalTrainees;
  final bool isLocked;
  final List<Subscriber> subscribers;
  final DateTime createdAt;
  final DateTime updatedAt;

  DetailsTrainerProfile({
    required this.id,
    required this.user,
    required this.name,
    required this.bio,
    required this.yearsOfExperience,
    required this.location,
    this.certificates = const [],
    this.plans = const [],
    required this.totalTrainees,
    required this.isLocked,
    this.subscribers = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  factory DetailsTrainerProfile.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return DetailsTrainerProfile(
      id: data['_id'],
      user: data['user'],
      name: data['name'],
      bio: data['bio'],
      yearsOfExperience: data['yearsOfExperience'],
      location: data['location'],
      certificates: data['certificates'] != null
          ? List<String>.from(data['certificates'])
          : [],
      plans: data['plans'] != null
          ? (data['plans'] as List).map((plan) => Plan.fromJson(plan)).toList()
          : [],
      totalTrainees: data['totalTrainees'],
      isLocked: data['isLocked'],
      subscribers: data['subscribers'] != null
          ? (data['subscribers'] as List).map((sub) => Subscriber.fromJson(sub)).toList()
          : [],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
    );
  }
}

class Plan {
  final String name;
  final String type;
  final double price;
  final String description;

  Plan({
    required this.name,
    required this.type,
    required this.price,
    required this.description,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      name: json['name'],
      type: json['type'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}

class Subscriber {
  final String user;
  final DateTime startDate;
  final DateTime endDate;
  final String id;

  Subscriber({
    required this.user,
    required this.startDate,
    required this.endDate,
    required this.id,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) {
    return Subscriber(
      user: json['user'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      id: json['_id'],
    );
  }
}