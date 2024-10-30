import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/Model/Workout%20Model.dart';

import '../../../../../../Add Alarm Screen/Add Alarm Screen.dart';
import '../View Model/workout_cubit.dart';

class WorkoutAlarms extends StatefulWidget {
  const WorkoutAlarms({super.key});

  @override
  State<WorkoutAlarms> createState() => _WorkoutAlarmsState();
}

class _WorkoutAlarmsState extends State<WorkoutAlarms> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAlarm(index: 3,)));
          },
          child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xff40D876), shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        ),

        body: BlocConsumer<WorkoutCubit, WorkoutState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.builder(
                itemCount: WorkoutCubit.get(context).workout.length,
                itemBuilder: (BuildContext, index) {
                  return GestureDetector(
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      final now = DateTime.now();
                      DateTime? selectedDateTime;

                      if (pickedTime != null) {
                        if (pickedTime.hour.isLowerThan(now.hour)) {
                          selectedDateTime = DateTime(
                            now.year,
                            now.month,
                            now.day + 1,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                          print(pickedTime.hour);
                          print(now.hour);
                        } else {
                          if (pickedTime.hour.isEqual(now.hour) &&
                              pickedTime.minute.isLowerThan(now.minute)) {
                            selectedDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day + 1,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          } else {
                            selectedDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          }
                        }
                        String formattedTime =
                            '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';

                        WorkoutCubit.get(context)
                            .updateMealTime(index, formattedTime);
                        await Alarm.stop(
                            WorkoutCubit.get(context).workout[index].id);

                        await Alarm.set(
                            alarmSettings: AlarmSettings(
                          id: WorkoutCubit.get(context).workout[index].id,
                          dateTime: selectedDateTime,
                          assetAudioPath: 'assets/alarm.mp3',
                          loopAudio: true,
                          vibrate: true,
                          volume: 0.8,
                          fadeDuration: 3.0,
                          warningNotificationOnKill: Platform.isIOS,
                          notificationSettings: NotificationSettings(
                            body:
                                "Time for ${WorkoutCubit.get(context).workout[index].name}",
                            title: "Alarm",
                            stopButton: 'stop',
                          ),
                        ));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            WorkoutCubit.get(context)
                                .workout[index]
                                .name
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * .05,
                                color: Colors.white),
                          ),
                          Text(
                            WorkoutCubit.get(context).workout[index].time,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * .055,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
