// File: models/trainer_model.dart

import 'dart:convert';

class TrainerResponse {
  final int results;
  final int totalCount;
  final PaginationResult paginationResult;
  final List<Trainer> data;

  TrainerResponse({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });

  factory TrainerResponse.fromJson(Map<String, dynamic> json) {
    return TrainerResponse(
      results: json['results'],
      totalCount: json['totalCount'],
      paginationResult: PaginationResult.fromJson(json['paginationResult']),
      data: List<Trainer>.from(json['data'].map((x) => Trainer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'totalCount': totalCount,
      'paginationResult': paginationResult.toJson(),
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class PaginationResult {
  final int currentPage;
  final int limit;
  final int numberOfPages;

  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) {
    return PaginationResult(
      currentPage: json['currentPage'],
      limit: json['limit'],
      numberOfPages: json['numberOfPages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'limit': limit,
      'numberOfPages': numberOfPages,
    };
  }
}

class Trainer {
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

  Trainer({
    required this.id,
    required this.user,
    required this.name,
    required this.bio,
    required this.yearsOfExperience,
    required this.location,
    required this.certificates,
    required this.plans,
    required this.totalTrainees,
    required this.isLocked,
    required this.subscribers,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['_id'],
      user: json['user'],
      name: json['name'],
      bio: json['bio'],
      yearsOfExperience: json['yearsOfExperience'],
      location: json['location'],
      certificates: List<String>.from(json['certificates']),
      plans: List<Plan>.from(json['plans'].map((x) => Plan.fromJson(x))),
      totalTrainees: json['totalTrainees'],
      isLocked: json['isLocked'],
      subscribers: List<Subscriber>.from(
          json['subscribers'].map((x) => Subscriber.fromJson(x))),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'name': name,
      'bio': bio,
      'yearsOfExperience': yearsOfExperience,
      'location': location,
      'certificates': certificates,
      'plans': plans.map((x) => x.toJson()).toList(),
      'totalTrainees': totalTrainees,
      'isLocked': isLocked,
      'subscribers': subscribers.map((x) => x.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Plan {
  final String name;
  final String type;
  final int price;
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
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'price': price,
      'description': description,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      '_id': id,
    };
  }
}
