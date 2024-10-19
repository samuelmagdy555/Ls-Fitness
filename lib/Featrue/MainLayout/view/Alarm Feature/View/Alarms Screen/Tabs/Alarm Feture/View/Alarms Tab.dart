import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View%20Model/alarm_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../../View Model/Alarm Provider/Alarm Provider.dart';
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
        body: BlocConsumer<AlarmCubit, AlarmState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          padding: EdgeInsets.only(top: height * 0.01),
            itemCount: AlarmCubit.get(context).meals.length,
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
                          if (pickedTime.hour!.isLowerThan(now.hour)) {
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
                            if (pickedTime.hour!.isEqual(now.hour) &&
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
                              AlarmCubit.get(context).meals[index].id!);

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
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: .5,
                    ),
                  ],
                ),
              );
            });
      },
    ));
  }
}
