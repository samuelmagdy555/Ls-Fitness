import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Model/Vitamin Model.dart';

part 'vitamin_state.dart';

class VitaminCubit extends Cubit<VitaminState> {
  VitaminCubit() : super(VitaminInitial());

  static VitaminCubit get(context) => BlocProvider.of(context);

  late SharedPreferences preferences;

  List<Vitamin> vitamin = [

    Vitamin(name: 'Potassium Chloride', time: '00:00', id: 8, status: false),
    Vitamin(name: 'Potassium Bicarbonate', time: '00:00', id: 9, status: false),
    Vitamin(name: 'Potassium Phosphate', time: '00:00', id: 10, status: false),
    Vitamin(name: 'Potassium Citrate', time: '00:00', id: 11, status: false),
    Vitamin(name: 'Potassium Gluconate', time: '00:00', id: 12, status: false),
    Vitamin(name: 'Potassium Orotate', time: '00:00', id: 13, status: false),
    Vitamin(name: 'Beta-Sitosterol', time: '00:00', id: 14, status: false),
    Vitamin(name: 'CranRich', time: '00:00', id: 15, status: false),
    Vitamin(name: 'Alpha-Lipoic Acid 150', time: '00:00', id: 16, status: false),
    Vitamin(name: 'Potassium', time: '00:00', id: 17, status: false),
    Vitamin(name: 'Ashwagandha', time: '00:00', id: 18, status: false),
    Vitamin(name: 'Vitamin C', time: '00:00', id: 19, status: false),
    Vitamin(name: 'Tongkat ali', time: '00:00', id: 20, status: false),
    Vitamin(name: 'Omega 3', time: '00:00', id: 21, status: false),
    Vitamin(name: 'Zinc', time: '00:00', id: 22, status: false),
    Vitamin(name: 'Multivitamin', time: '00:00', id: 23, status: false),
    Vitamin(name: 'Magnesium Citrate', time: '00:00', id: 24, status: false),
    Vitamin(name: 'Magnesium Glycinate', time: '00:00', id: 25, status: false),
    Vitamin(name: 'Magnesium Oxide', time: '00:00', id: 26, status: false),
    Vitamin(name: 'Magnesium Tauronate', time: '00:00', id: 27, status: false),
    Vitamin(name: 'Magnesium Malate', time: '00:00', id: 28, status: false),
    Vitamin(name: 'Magnesium Chloride', time: '00:00', id: 29, status: false),
    Vitamin(name: 'Melatonin', time: '00:00', id: 30, status: false),
    Vitamin(name: 'N-AcetylLcysteine , NAC', time: '00:00', id: 31, status: false),
    Vitamin(name: 'Vitamin K', time: '00:00', id: 32, status: false),
    Vitamin(name: 'Vitamin K2', time: '00:00', id: 33, status: false),
    Vitamin(name: 'Vitamin D3', time: '00:00', id: 34, status: false),
    Vitamin(name: 'D3-K2', time: '00:00', id: 35, status: false),
    Vitamin(name: 'Calcium', time: '00:00', id: 36, status: false),
    Vitamin(name: 'Vitamin A', time: '00:00', id: 37, status: false),
    Vitamin(name: 'Vitamin E', time: '00:00', id: 38, status: false),
    Vitamin(name: 'E 400', time: '00:00', id: 39, status: false),
    Vitamin(name: 'B-50 (B-Complex)', time: '00:00', id: 40, status: false),
    Vitamin(name: 'B-Complex', time: '00:00', id: 41, status: false),
    Vitamin(name: 'B1-Thiamine', time: '00:00', id: 42, status: false),
    Vitamin(name: 'B2-Riboflavin', time: '00:00', id: 43, status: false),
    Vitamin(name: 'B3-Niacin', time: '00:00', id: 44, status: false),
    Vitamin(name: 'B5-Pantothenic Acid', time: '00:00', id: 45, status: false),
    Vitamin(name: 'B6-Pyridoxine', time: '00:00', id: 46, status: false),
    Vitamin(name: 'B7-Biotin', time: '00:00', id: 47, status: false),
    Vitamin(name: 'B9-Folic Acid', time: '00:00', id: 48, status: false),
    Vitamin(name: 'B12', time: '00:00', id: 49, status: false),
    Vitamin(name: 'D-Glucosamine (Aloe Vera)', time: '00:00', id: 50, status: false),
    Vitamin(name: 'Propolis 1500', time: '00:00', id: 51, status: false),
  ];



  void updateMealStatus(int index, bool newStatus) {
    print('old status ${vitamin[index].status}');

    vitamin[index].status = newStatus;
    print('new status ${vitamin[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  List<String> listofstring = [];

  Future<void> initializeVitamin() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('vitamin');

    if (storedMeals == null) {
      setMeals();
    } else {
      vitamin =
          storedMeals.map((e) => Vitamin.fromJson(json.decode(e))).toList();
      emit(InitializeVitamin());
    }
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
        vitamin.map((meal) => json.encode(meal.toJson())).toList();
    preferences.setStringList('vitamin', mealStrings);
    emit(SetVitamin());
  }

  void updateMealTime(int index, String newTime) {
    vitamin[index].time = newTime;
    setMeals();
    emit(UpdateTime());
  }

  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("vitamin");

    if (cominglist == null) {
    } else {
      vitamin =
          cominglist.map((e) => Vitamin.fromJson(json.decode(e[0]))).toList();
      emit(GetDataState());
    }
  }

  SetData() {
    listofstring = vitamin.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("vitamin", listofstring);

    emit(SetDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    vitamin.add(Vitamin(name: label, time: dateTime, id: id, status: check));
    emit(SetAlarm());
    SetData();
  }

  int generateUniqueId(List<Vitamin> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((vitamin) => vitamin.id == id));

    return id;
  }
}
