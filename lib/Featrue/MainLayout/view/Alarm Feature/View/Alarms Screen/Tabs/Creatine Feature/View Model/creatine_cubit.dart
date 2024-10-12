import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:meta/meta.dart';

part 'creatine_state.dart';

class CreatineCubit extends Cubit<CreatineState> {
  CreatineCubit() : super(CreatineInitial());

  static CreatineCubit get(context) => BlocProvider.of(context);

  DateTime? wakeUpTime;

  DateTime? sleepTime;

  // WakeUp
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
// Sleep
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
}
