import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Creatine%20Feature/View%20Model/creatine_cubit.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../../View Model/Alarm Provider/Alarm Provider.dart';

class CreatineTab extends StatefulWidget {
  const CreatineTab({super.key});

  @override
  State<CreatineTab> createState() => _CreatineTabState();
}

class _CreatineTabState extends State<CreatineTab> {
  @override
  void initState() {
    CreatineCubit.get(context).getWakeUpTime();
    CreatineCubit.get(context).getSleepTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * .025,
          ),
          Text(
            'This page reminds you to take your daily amount of water required if you take creatine',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * .04, color: Colors.white30),
          ),
          SizedBox(
            height: height * .025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wake up time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * .055,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                CreatineCubit.get(context).wakeUpTime == null
                    ? BlocConsumer<CreatineCubit, CreatineState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: TextButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (pickedTime != null) {
                                    CreatineCubit.get(context).setWakeUpTime(
                                      DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  '00:00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: width * .055,
                                      color: kThirdColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        },
                      )
                    : BlocConsumer<CreatineCubit, CreatineState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (pickedTime != null) {
                                    CreatineCubit.get(context).setWakeUpTime(
                                      DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  CreatineCubit.get(context)
                                          .wakeUpTime!
                                          .toLocal()
                                          .hour
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':' +
                                      CreatineCubit.get(context)
                                          .wakeUpTime!
                                          .toLocal()
                                          .minute
                                          .toString()
                                          .padLeft(2, '0'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: width * .055,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ));
                        },
                      ),
              ],
            ),
          ),
          SizedBox(
            height: height * .025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sleep time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * .055,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                CreatineCubit.get(context).sleepTime == null
                    ? BlocConsumer<CreatineCubit, CreatineState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: TextButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (pickedTime != null) {
                                    CreatineCubit.get(context).setSleepTime(
                                      DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  '00:00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: width * .055,
                                      color: kThirdColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        },
                      )
                    : BlocConsumer<CreatineCubit, CreatineState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (pickedTime != null) {
                                    CreatineCubit.get(context).setSleepTime(
                                      DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  CreatineCubit.get(context)
                                          .sleepTime!
                                          .toLocal()
                                          .hour
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':' +
                                      CreatineCubit.get(context)
                                          .sleepTime!
                                          .minute
                                          .toString()
                                          .padLeft(2, '0'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: width * .055,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ));
                        },
                      ),
              ],
            ),
          ),
          SizedBox(
            height: height * .025,
          ),
          RollingSwitch.widget(
            onChanged: (bool state) {
              if (state == true) {
                if (CreatineCubit.get(context).wakeUpTime == null ||
                    CreatineCubit.get(context).sleepTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Please make sure that the time to go to sleep and wake up have been set'),
                    ),
                  );
                } else {
                  DateTime dateTime = DateTime.now();
                  CreatineCubit.get(context).getWakeUpTime();
                  CreatineCubit.get(context).getWakeUpTime();

                  if (
                  dateTime.hour ==
                      CreatineCubit.get(context).sleepTime!.hour - 1) {
                    final alarmSettings = AlarmSettings(
                      id: 7,
                      dateTime: DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day+1,
                          CreatineCubit.get(context).wakeUpTime!.hour + 2 , ),
                      assetAudioPath: 'assets/alarm.mp3',
                      loopAudio: true,
                      vibrate: true,
                      volume: 0.8,
                      fadeDuration: 3.0,
                      warningNotificationOnKill: Platform.isIOS,
                      notificationSettings: NotificationSettings(
                        body: "Time for Water",
                        title: "Alarm",
                        stopButton: 'stop',
                      ),
                    );
                    Alarm.set(
                      alarmSettings: alarmSettings,
                    );
                  } else {
                    final alarmSettings = AlarmSettings(
                      id: 7,
                      dateTime: DateTime(dateTime.year, dateTime.month,
                          dateTime.day, dateTime.hour + 2 , dateTime.minute),
                      assetAudioPath: 'assets/alarm.mp3',
                      loopAudio: true,
                      vibrate: true,
                      volume: 0.8,
                      fadeDuration: 3.0,
                      warningNotificationOnKill: Platform.isIOS,
                      notificationSettings: NotificationSettings(
                        body: "Time for Water",
                        title: "Alarm",
                        stopButton: 'stop',
                      ),
                    );
                    Alarm.set(
                      alarmSettings: alarmSettings,
                    );
                  }
                }
              }
              if (state == true) {
               Alarm.stop(7);
              }
            },
            rollingInfoRight: RollingWidgetInfo(
              text: Text('On'),
            ),
            rollingInfoLeft: RollingWidgetInfo(
              backgroundColor: Colors.grey,
              text: Text('Off'),
            ),
          ),
        ],
      ),
    );
  }
}
