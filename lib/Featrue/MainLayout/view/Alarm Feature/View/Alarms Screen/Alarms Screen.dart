import 'dart:async';

import 'package:flutter/material.dart';
import 'Add Alarm Screen/Add Alarm Screen.dart';
import 'package:provider/provider.dart';

import 'Tabs/Alarm Feture/View/Alarms/Meal Alarms/View Model/alarm_cubit.dart';
import 'Tabs/Alarms Schedule/View/Alarm Schedule Screen.dart';
import 'Tabs/Creatine Feature/View/Creatine Tab.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<TimerScreen> with TickerProviderStateMixin {
  bool value = false;
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Alarms',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            SizedBox(
              height: height * .075,
              width: width,
              child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  controller: tabController,
                  tabs: [
                    Tab(
                      text: "All Alarms",
                    ),
                    Tab(
                      text: "Creatine Alarms",
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              AlarmSchedule(),
              CreatineTab(),
            ]))
          ],
        ));
  }
}
