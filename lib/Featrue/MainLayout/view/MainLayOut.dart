import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
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
    TimerScreen(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(

        itemPadding: EdgeInsets.symmetric(horizontal: width * .01, vertical: width * .02),
        duration: const Duration(milliseconds: 1000),
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i ==2){

          }
          if(i == 5){


          }
          if (i == 3){

          }
          if(i == 1){
            // ExerciseCubit.get(context).getExercise();


          }
          if(i==4){
          ProfileCubit.get(context).myProfile();

          }
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .033,
                width: width * .11,
                child: const Image(image: AssetImage('assets/images/gym-10968080-unscreen.gif'))),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .033,
                width: width * .11,
                child: const Image(image: AssetImage('assets/images/dumbbells-17581697-unscreen.gif'))),
            title: const Text('Exercise'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .033,
                width: width * .11,
                child: const Image(image: AssetImage('assets/images/intermittent-fasting-16862112-unscreen.gif'))),
            title: const Text('Meals'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .033,
                width: width * .11,
                child: const Image(image: AssetImage('assets/images/protein-17465892-unscreen.gif'))),
            title: const Text('Creatine'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
                height: height * .033,
                width: width * .11,
                child: const Image(image: AssetImage('assets/images/settings_3524636.png'))),
            title: const Text('Profile'),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: pages[_currentIndex],
    );
  }
}
