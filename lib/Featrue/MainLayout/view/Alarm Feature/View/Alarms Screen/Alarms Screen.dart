import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarms%20Tab.dart';

import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import '../../View Model/Alarm Provider/Alarm Provider.dart';
import 'Add Alarm Screen/Add Alarm Screen.dart';
import 'package:provider/provider.dart';

import 'Tabs/Creatine Feature/View/Creatine Tab.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<TimerScreen> with TickerProviderStateMixin {
  bool value = false;
  TabController ? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    context.read<alarmprovider>().Inituilize(context);
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
    context.read<alarmprovider>().GetData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => context.read<alarmprovider>(

      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Alarms',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          floatingActionButton: tabController!.index==0?GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddAlarm()));
            },
            child: Container(
                margin: EdgeInsets.all(8),
                decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.add),
                )),
          ) : null,
          body: Column(
            children: [
              SizedBox(

                height: height*.075,
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
                    ]
                ),
              ),
              Expanded(
                  child: TabBarView(controller: tabController,
                      children: [
                        AlarmsTab(),
                        CreatineTab(),
                      ]))
            ],
          )
      ),

    );
  }
}
