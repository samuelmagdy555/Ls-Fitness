import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Creatine Model.dart';

part 'creatine_state.dart';

class CreatineCubit extends Cubit<CreatineState> {
  CreatineCubit() : super(CreatineInitial());

  static CreatineCubit get(context) => BlocProvider.of(context);

  DateTime? wakeUpTime;

  DateTime? sleepTime;
  late SharedPreferences preferences;

  List<String> listofstringByCup = [
  ];

  List<String> listofstring = [


  ];

  List<CreatineModel> waterByLiter = [
    CreatineModel(name: 'Drink .5 Liter', time: '00:00' , id: 65, status: false, ),
    CreatineModel(name: 'Drink 1 Liter', time: '00:00',id: 67, status: false, ),
    CreatineModel(name: 'Drink 1.5 Liter', time: '00:00',id:68, status: false, ),
    CreatineModel(name: 'Drink 2 Liter', time: '00:00',id: 70, status: false, ),
    CreatineModel(name: 'Drink 2.5 Liter', time: '00:00',id: 71, status: false,),
    CreatineModel(name: 'Drink 3 Liter', time: '00:00',id: 73, status: false, ),
    CreatineModel(name: 'Drink 3.5 Liter', time: '00:00',id: 74, status: false, ),
    CreatineModel(name: 'Drink 4 Liter', time: '00:00',id: 76, status: false, ),
  ];
  List<CreatineModel> waterByCup = [
    CreatineModel(name: 'Drink 1 Cup of Water', time: '00:00' , id: 66, status: false, ),
    CreatineModel(name: 'Drink 2 Cup of Water', time: '00:00',id: 69, status: false, ),
    CreatineModel(name: 'Drink 3 Cup of Water', time: '00:00',id: 72, status: false,),
    CreatineModel(name: 'Drink 4 Cup of Water', time: '00:00',id: 75, status: false, ),
    CreatineModel(name: 'Drink 5 Cup of Water', time: '00:00',id: 77, status: false),
    CreatineModel(name: 'Drink 6 Cup of Water', time: '00:00',id: 78, status: false),
  ];



  Future<void> setWakeUpTime(DateTime time) async {
    wakeUpTime = time;
    CashHelper.insertToCash(key: 'wakeUpTime', value: time.toIso8601String());
    print(time.toIso8601String());
    emit(SetWakeupTime());
  }

  Future<void> getWakeUpTime() async {
    String? theSleepTime = await CashHelper.getFromCash(key: 'wakeUpTime');
    if (theSleepTime != null) {
      wakeUpTime = DateTime.parse(theSleepTime);
    }

    emit(GetSleepTime());
  }

  void setSleepTime(DateTime time) {
    sleepTime = time;
    CashHelper.insertToCash(key: 'sleepTime', value: time.toIso8601String());
    print(time.toIso8601String());
    emit(SetSleepTime());
  }

  Future<void> getSleepTime() async {
    String? theSleepTime = await CashHelper.getFromCash(key: 'sleepTime');
    if (theSleepTime != null) {
      sleepTime = DateTime.parse(theSleepTime);
    }
    emit(GetSleepTime());
  }

  bool alarmState = true;


  Future<void> initializeCreatine() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('CreatineByLiter');

    if (storedMeals == null) {
      setCreatine();
    } else {
      waterByLiter = storedMeals.map((e) => CreatineModel.fromJson(json.decode(e))).toList();
      emit(InitializeCreatine());
    }
  }

  void setCreatine() {
    List<String> mealStrings =
    waterByLiter.map((s) => json.encode(s.toJson())).toList();
    preferences.setStringList('CreatineByLiter', mealStrings);
    emit(SetCreatine());
  }

  void updateCreatineTime(int index, String newTime) {
    waterByLiter[index].time = newTime;
    setCreatine();
    emit(UpdateCreatineTime());
  }

  void updateMealStatus(int index, bool newStatus) {
    print('old status ${waterByLiter[index].status}');

    waterByLiter[index].status = newStatus;
    print('new status ${waterByLiter[index].status}');
    setCreatine();
    emit(UpdateStatus());
  }
  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("CreatineByLiter");

    if (cominglist == null) {} else {
      waterByLiter = cominglist.map((e) => CreatineModel.fromJson(json.decode(e))).toList();
      emit(GetCreatineDataState());
    }
  }

  SetData() {
    listofstring = waterByLiter.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("CreatineByLiter", listofstring);

    emit(SetCreatineDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    waterByLiter.add(CreatineModel(name: label , time: dateTime, id: id, status: check,  ));
    emit(SetCreatineAlarm());
    SetData();
  }

  Future<void> changeAlarmState(bool state) async {
    preferences = await SharedPreferences.getInstance();

    preferences.setBool('alarmState', state);

    emit(ChangeAlarmState());
  }

  Future<void> getAlarmState() async {
    preferences = await SharedPreferences.getInstance();
    final alarmState = preferences.getBool('alarmState');
    print(state);

    emit(GetAlarmState(alarmState!));
  }

  //////
  Future<void> initializeCreatineByCup() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('CreatineByCup');

    if (storedMeals == null) {
      setCreatine();
    } else {
      waterByCup = storedMeals.map((e) => CreatineModel.fromJson(json.decode(e))).toList();
      emit(InitializeCreatine());
    }
  }


  void setCreatineByCup() {
    List<String> mealStrings =
    waterByCup.map((s) => json.encode(s.toJson())).toList();
    preferences.setStringList('CreatineByCup', mealStrings);
    emit(SetCreatine());
  }

  void updateCreatineTimeByCup(int index, String newTime) {
    waterByCup[index].time = newTime;
    setCreatine();
    emit(UpdateCreatineTime());
  }

  void updateMealStatusByCup(int index, bool newStatus) {
    print('old status ${waterByCup[index].status}');

    waterByCup[index].status = newStatus;
    print('new status ${waterByCup[index].status}');
    setCreatine();
    emit(UpdateStatus());
  }
  GetDataByCup() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("CreatineByCup");

    if (cominglist == null) {} else {
      waterByCup = cominglist.map((e) => CreatineModel.fromJson(json.decode(e))).toList();
      emit(GetCreatineDataState());
    }
  }

  SetDataByCup() {
    listofstringByCup = waterByCup.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("CreatineByLiter", listofstringByCup);

    emit(SetCreatineDataState());
  }

  SetAlaramByCup(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    waterByCup.add(CreatineModel(name: label , time: dateTime, id: id, status: check,  ));
    emit(SetCreatineAlarm());
    SetData();
  }





}
