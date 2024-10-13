import 'dart:io';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View%20Model/alarm_cubit.dart';

import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../View Model/Alarm Provider/Alarm Provider.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlaramState();
}

class _AddAlaramState extends State<AddAlarm> {
  late TextEditingController controller;

  String? dateTime;
  bool repeat = false;

  DateTime? notificationtime;

  String? name = "none";
  int? Milliseconds;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  DateTime nextAlarmTime() {
    final now = DateTime.now();
    final alarmTime = DateTime(now.year, now.month, now.day, 8, 0); // 8:00 AM

    if (now.isAfter(alarmTime)) {
      return alarmTime
          .add(Duration(days: 1)); // Next day if the time has passed
    } else {
      return alarmTime; // Same day if time has not passed yet
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThirdColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Add Alarm',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              showDayOfWeek: false,
              minimumDate: DateTime.now(),
              dateOrder: DatePickerDateOrder.dmy,
              onDateTimeChanged: (va) {
                dateTime = DateFormat().add_jms().format(va);

                Milliseconds = va.microsecondsSinceEpoch;

                notificationtime = va;

                print(dateTime);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoTextField(
                  placeholder: "Add Label",
                  controller: controller,
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Repeat daily"),
              ),
              CupertinoSwitch(
                value: repeat,
                onChanged: (bool value) {
                  repeat = value;

                  if (repeat == false) {
                    name = "none";
                  } else {
                    name = "Everyday";
                  }

                  setState(() {});
                },
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {


                int id = AlarmCubit.get(context).generateUniqueId(AlarmCubit.get(context).meals);

                final alarmSettings = AlarmSettings(
                  id: id,
                  dateTime: notificationtime!,
                  assetAudioPath: 'assets/alarm.mp3',
                  loopAudio: true,
                  vibrate: true,
                  volume: 0.8,
                  fadeDuration: 3.0,
                  warningNotificationOnKill: Platform.isIOS,
                  notificationSettings: NotificationSettings(
                    body: "Time for ${controller.text}",
                    title: "Alarm",
                    stopButton: 'stop',
                  ),
                );
                await Alarm.set(
                  alarmSettings: alarmSettings,
                );

                AlarmCubit.get(context).SetAlaram(
                    controller.text, dateTime!, true, '',id , Milliseconds!);

                Navigator.pop(context);
              },
              child: Text("Set Alaram")),
        ],
      ),
    );
  }
}
