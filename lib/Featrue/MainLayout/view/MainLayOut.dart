import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Meals/view/meals.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../Auth Feature/goals/View/AgeSelection.dart';
import '../../Auth Feature/goals/View/End.dart';
import 'Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import 'Exercise/view/exercise.dart';
import 'Home/View/HomeScreen.dart';
import 'Profile/view/Profile.dart';
import 'Profile/view_model/profile_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var _currentIndex = 0;

  List<Widget> pages = [
    HomeView(),
    WorkoutScreen(),
    FoodListPage(),
    TimerScreen(value: false,),
    FoodCalculator(mealCategory: ''),

    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        itemPadding: EdgeInsets.symmetric(
            horizontal: width * .01, vertical: width * .02),
        duration: const Duration(milliseconds: 1000),
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == 2) {}
          if (i == 5) {}
          if (i == 3) {}
          if (i == 1) {
            // ExerciseCubit.get(context).getExercise();
          }
          if (i == 4) {
            ProfileCubit.get(context).myProfile();
          }
          setState(() {
            _currentIndex = i;
          });
        },

        items: [
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage('assets/images/muscle Home.png'))),
            title: const Text('', style: TextStyle(color: Colors.white)),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage('assets/images/dumbbell home.png'))),
            title: const Text('',style: TextStyle(color: Colors.white)),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage(
                        'assets/images/food-safety home.png'))),
            title: const Text('',style: TextStyle(color: Colors.white),),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage(
                        'assets/images/reminder home.png' ,)
                )),
            title: const Text('',style: TextStyle(color: Colors.white)),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage(
                        'assets/images/calculator.png' ,)
                )),
            title: const Text('',style: TextStyle(color: Colors.white)),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .03,
                width: width * .11,
                child: const Image(
                    image: AssetImage('assets/images/settings home.png'))),
            title: const Text('',style: TextStyle(color: Colors.white),),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: pages[_currentIndex],
    );
  }
}
