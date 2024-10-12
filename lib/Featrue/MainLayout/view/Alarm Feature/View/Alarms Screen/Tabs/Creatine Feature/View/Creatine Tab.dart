import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Creatine%20Feature/View%20Model/creatine_cubit.dart';

import '../../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';

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
                  style: TextStyle(fontSize: width * .055, color: Colors.white),
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
                        padding: EdgeInsets.all(2),
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
                            CreatineCubit.get(context).wakeUpTime!.toLocal().hour.toString().padLeft(2, '0') + ':' + CreatineCubit.get(context).wakeUpTime!.toLocal().minute.toString().padLeft(2, '0'),
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
                  style: TextStyle(fontSize: width * .055, color: Colors.white),
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
                        padding: EdgeInsets.all(2),
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
                            CreatineCubit.get(context).sleepTime!.toLocal().hour.toString().padLeft(2, '0') + ':' + CreatineCubit.get(context).sleepTime!.minute.toString().padLeft(2, '0'),
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

        ],
      ),
    );
  }
}
