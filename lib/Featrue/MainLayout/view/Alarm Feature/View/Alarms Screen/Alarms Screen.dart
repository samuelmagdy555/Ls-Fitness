import 'package:flutter/material.dart';
import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Sleep%20Alarms/View/Sleep%20Alarms.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/View/Supplement%20Meals.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/View/Workout%20Alarms.dart';
import 'Tabs/Alarm Feture/View/Alarms/Meal Alarms/View/Meal Alarms.dart';
import 'Tabs/Alarm Feture/View/Alarms/Vitamine Alarms/View/Vitamin Alarms.dart';
import 'Tabs/Creatine Feature/View/Creatine Tab.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<TimerScreen> with TickerProviderStateMixin {
  bool value = false;
  TabController? tabController;

   List<String> c = ['Meals',
    'Supplement',
    'Sleep',
    'Workout',
    'Vitamin',
    'Creatine',];
  int num = 0;
  String? selectedValue;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
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
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: c.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        num = index;
                        tabController!.animateTo(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: num == index ? kSecondColor : Colors.grey,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        c[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              MealsAlarms(),
              SupplementsAlarms(),
              SleepAlarms(),
              WorkoutAlarms(),
                  VitaminAlarms(),
                  CreatineTab()
            ]))
          ],
        ));
  }
}
