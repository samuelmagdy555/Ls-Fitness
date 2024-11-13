import 'package:flutter/material.dart';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../../../Add Alarm Screen/Add Alarm Screen.dart';
import '../View Model/alarm_cubit.dart';

class MealsAlarms extends StatefulWidget {
  const MealsAlarms({super.key});

  @override
  State<MealsAlarms> createState() => _MealsAlarmsState();
}

class _MealsAlarmsState extends State<MealsAlarms> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddAlarm(index: 0,)));
          },
          child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xff40D876), shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.add , color: Colors.white,),
              )),
        ),

        body: BlocConsumer<AlarmCubit, AlarmState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.builder(
                itemCount: AlarmCubit.get(context).meals.length,
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

                        AlarmCubit.get(context)
                            .updateMealTime(index, formattedTime);
                        await Alarm.stop(
                            AlarmCubit.get(context).meals[index].id);

                        await Alarm.set(
                            alarmSettings: AlarmSettings(
                              id: AlarmCubit.get(context).meals[index].id,
                              dateTime: selectedDateTime,
                              assetAudioPath: 'assets/alarm.mp3',
                              loopAudio: true,
                              vibrate: true,
                              volume: 0.8,
                              fadeDuration: 3.0,
                              warningNotificationOnKill: Platform.isIOS,
                              notificationSettings: NotificationSettings(
                                body:
                                "Time for ${AlarmCubit.get(context).meals[index].name}",
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
                            AlarmCubit.get(context)
                                .meals[index]
                                .name
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * .05,
                                color: Colors.white),
                          ),
                          Text(
                            AlarmCubit.get(context).meals[index].time,
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
