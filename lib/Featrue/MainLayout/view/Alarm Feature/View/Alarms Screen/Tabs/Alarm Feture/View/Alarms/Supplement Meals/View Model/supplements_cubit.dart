import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Sleep Alarms/Model/Sleep Model.dart';
import '../Model/Supplement.dart';

part 'supplements_state.dart';

class SupplementsCubit extends Cubit<SupplementsState> {
  SupplementsCubit() : super(SupplementsInitial());

  List<Supplement> supplements = [
    Supplement(name: 'Protein', time: '00:00' , id: 8),
    Supplement(name: 'Carbs', time: '00:00',id: 9),
    Supplement(name: 'PreWorkout', time: '00:00',id: 10),
    Supplement(name: 'BCAAs ', time: '00:00',id: 11),
    Supplement(name: 'Omega', time: '00:00',id: 12),
    Supplement(name: 'Vitamins', time: '00:00',id: 13),
    Supplement(name: 'Glutathione  ', time: '00:00',id: 14),

  ];

  Future<void> initializeSupplements() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('Supplement');

    if (storedMeals == null) {
      setMeals();
    } else {
      supplements = storedMeals.map((e) => Supplement.fromJson(json.decode(e))).toList();
      emit(InitializeSupplements());
    }
  }
  static SupplementsCubit get(context) => BlocProvider.of(context);


  late SharedPreferences preferences;


  List<String> listofstring = [];



  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
    supplements.map((s) => json.encode(s.toJson())).toList();
    preferences.setStringList('Supplement', mealStrings);
    emit(SetSupplements());
  }

  void updateMealTime(int index, String newTime) {
    supplements[index].time = newTime;
    setMeals();
    emit(UpdateSupplementsTime());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("Supplement");

    if (cominglist == null) {} else {
      supplements = cominglist.map((e) => Supplement.fromJson(json.decode(e))).toList();
      emit(GetSupplementsDataState());
    }
  }

  SetData() {
    listofstring = supplements.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("Supplement", listofstring);

    emit(SetSupplementsDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    supplements.add(Supplement(name: label , time: dateTime, id: id));
    emit(SetSupplementsAlarm());
    SetData();
  }


  int generateUniqueId(List<Supplement> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(50);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }
}
