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
    Supplement(name: 'Protein', time: '00:00', id: 55, status: false),
    Supplement(name: 'BCAA', time: '00:00', id: 56, status: false),
    Supplement(name: 'Glutamine', time: '00:00', id: 57, status: false),
    Supplement(name: 'Mass Gainer', time: '00:00', id: 58, status: false),
    Supplement(name: 'EAA', time: '00:00', id: 59, status: false),
    Supplement(name: 'Karbolyn', time: '00:00', id: 60, status: false),
    Supplement(name: 'Fat Burner', time: '00:00', id: 88, status: false),
    Supplement(name: 'Pre-Workout', time: '00:00', id: 89, status: false),
    Supplement(name: 'Creatinine', time: '00:00', id: 90, status: false),
    Supplement(name: 'Vitargon', time: '00:00', id: 91, status: false),
    Supplement(name: 'AL-Carnitine', time: '00:00', id: 92, status: false),
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
    supplements.add(Supplement(name: label , time: dateTime, id: id, status: check));
    emit(SetSupplementsAlarm());
    SetData();
  }

  void updateSupplementStatus(int index, bool newStatus) {
    print('old status ${supplements[index].status}');

    supplements[index].status = newStatus;
    print('new status ${supplements[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  int generateUniqueId(List<Supplement> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }
}
