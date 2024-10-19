import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Meal%20Alarms/Model/Meals%20Model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());
  static AlarmCubit get(context) => BlocProvider.of(context);

  late SharedPreferences preferences;


  List<String> listofstring = [];

  Future<void> initializeMeals() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('meals');

    if (storedMeals == null) {
      // لو أول مرة، نحفظ الوجبات الافتراضية
      setMeals();
    } else {
      // تحميل الوجبات المخزنة
      meals = storedMeals.map((e) => Meal.fromJson(json.decode(e))).toList();
      emit(InitializeMeals());
    }
  }



  List<Meal> meals = [
    Meal(name: 'Breakfast', time: '00:00' , id: 1),
    Meal(name: 'Lunch', time: '00:00',id: 2),
    Meal(name: 'Dinner', time: '00:00',id: 3),
    Meal(name: 'Training', time: '00:00',id: 4),
    Meal(name: 'Snack 1', time: '00:00',id: 5),
    Meal(name: 'Snack 2', time: '00:00',id: 6),
  ];
  List<Meal> Supplement = [
    Meal(name: 'Protein', time: '00:00' , id: 8),
    Meal(name: 'Carbs', time: '00:00',id: 9),
    Meal(name: 'PreWorkout', time: '00:00',id: 10),
    Meal(name: 'BCAAs ', time: '00:00',id: 11),
    Meal(name: 'Omega', time: '00:00',id: 12),
    Meal(name: 'Vitamins', time: '00:00',id: 13),
    Meal(name: 'Glutamine ', time: '00:00',id: 14),

  ];

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
    meals.map((meal) => json.encode(meal.toJson())).toList();
    preferences.setStringList('meals', mealStrings);
    emit(SetMeals());
  }

  void updateMealTime(int index, String newTime) {
    meals[index].time = newTime;
    setMeals();
    emit(UpdateTime());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("meals");

    if (cominglist == null) {} else {
      meals = cominglist.map((e) => Meal.fromJson(json.decode(e))).toList();
      emit(GetDataState());
    }
  }

  SetData() {
    listofstring = meals.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("meals", listofstring);

    emit(SetDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    meals.add(Meal(name: label , time: dateTime, id: id));
    emit(SetAlarm());
    SetData();
  }


  int generateUniqueId(List<Meal> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(50);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }

}
