// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'package:intl/intl.dart';
//
// import 'package:timezone/timezone.dart' as tz;
//
//
// import '../../Model/Alarm Model/Alarm Model.dart';
// import '../../Model/Meals Model/Meals Model.dart';
//
// class alarmprovider extends ChangeNotifier {
//   late SharedPreferences preferences;
//
//   List<Model> modelist = [];
//
//   List<String> listofstring = [];
//
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
//
//   late BuildContext context;
//
//   // قائمة تحتوي على العناصر من نوع Meal
//   List<Meal> meals = [
//     Meal(name: 'Breakfast', time: '00:00' , id: 1),
//     Meal(name: 'Lunch', time: '00:00',id: 2),
//     Meal(name: 'Dinner', time: '00:00',id: 3),
//     Meal(name: 'Training', time: '00:00',id: 4),
//     Meal(name: 'Snack 1', time: '00:00',id: 5),
//     Meal(name: 'Snack 2', time: '00:00',id: 6),
//   ];
//
//   Future<void> initializeMeals() async {
//     preferences = await SharedPreferences.getInstance();
//     List<String>? storedMeals = preferences.getStringList('meals');
//
//     if (storedMeals == null) {
//       // لو أول مرة، نحفظ الوجبات الافتراضية
//       setMeals();
//     } else {
//       // تحميل الوجبات المخزنة
//       meals = storedMeals.map((e) => Meal.fromJson(json.decode(e))).toList();
//       notifyListeners();
//     }
//   }
//
//
//   void setMeals() {
//     List<String> mealStrings =
//     meals.map((meal) => json.encode(meal.toJson())).toList();
//     preferences.setStringList('meals', mealStrings);
//     notifyListeners();
//   }
//
//   void updateMealTime(int index, String newTime) {
//     meals[index].time = newTime;
//     setMeals(); // تحديث البيانات في SharedPreferences
//     notifyListeners();
//   }
//
//   GetData() async {
//     preferences = await SharedPreferences.getInstance();
//
//     List<String>? cominglist = await preferences.getStringList("meals");
//
//     if (cominglist == null) {} else {
//       meals = cominglist.map((e) => Meal.fromJson(json.decode(e))).toList();
//       notifyListeners();
//     }
//   }
//
//   SetData() {
//     listofstring = meals.map((e) => json.encode(e.toJson())).toList();
//     preferences.setStringList("meals", listofstring);
//
//     notifyListeners();
//   }
//
//   SetAlaram(String label, String dateTime, bool check, String repeat, int id,
//       int milliseconds) {
//     meals.add(Meal(name: label , time: dateTime, id: id));
//     notifyListeners();
//     SetData();
//     notifyListeners();
//   }
//
//
//
//
//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   int generateUniqueId(List<Meal> meals) {
//     Random random = Random();
//     int id;
//
//
//     do {
//       id = random.nextInt(50);
//     } while (meals.any((meal) => meal.id == id));
//
//     return id;
//   }
// }
