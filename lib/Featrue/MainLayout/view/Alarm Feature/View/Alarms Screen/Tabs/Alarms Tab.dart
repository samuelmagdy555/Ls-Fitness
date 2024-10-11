import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../View Model/Alarm Provider/Alarm Provider.dart';
import 'dart:math';
import 'package:intl/intl.dart';


class AlarmsTab extends StatefulWidget {
  const AlarmsTab({super.key});

  @override
  State<AlarmsTab> createState() => _AlarmsTabState();
}

class _AlarmsTabState extends State<AlarmsTab> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<alarmprovider>(builder: (context, alarm, child) {
        return Container(
          child: ListView.builder(
              itemCount: alarm.meals.length,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          final now = DateTime.now();
                          DateTime? selectedDateTime;

                          if (pickedTime != null) {
                            selectedDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                            String formattedTime =
                                '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
                            final mealProvider = Provider.of<alarmprovider>(
                                context,
                                listen: false);
                            mealProvider.updateMealTime(index, formattedTime);
                            Alarm.stop(alarm.meals[index].id!);
                            Alarm.set(
                                alarmSettings: AlarmSettings(
                                  id: alarm.meals[index].id,
                                  dateTime: selectedDateTime,
                                  assetAudioPath: 'assets/alarm.mp3',
                                  loopAudio: true,
                                  vibrate: true,
                                  volume: 0.8,
                                  fadeDuration: 3.0,
                                  warningNotificationOnKill: Platform.isIOS,
                                  notificationSettings: NotificationSettings(
                                    body: "Time for ${alarm.meals[index].name}",
                                    title: "Alarm",
                                    stopButton: 'stop',
                                  ),
                                ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alarm.meals[index].name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * .05,

                                  color: Colors.white),
                            ),
                            Text(
                              alarm.meals[index].time,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * .055,

                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .005,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: .5,
                      ),
                    ],
                  ),
                );
              }),
        );
      })
    );
  }
}
