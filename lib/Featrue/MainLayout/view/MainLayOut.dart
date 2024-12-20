import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/View%20Model/main_layout_model_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/View/Nutrition%20View.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Vitamin%20View/Vitamin%20View.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Meals/view/meals.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Person/View/PersonView.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../Auth Feature/goals/View/AgeSelection.dart';
import '../../Auth Feature/goals/View/End.dart';
import 'Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import 'Courses Feature/View/Courses View.dart';
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

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    PersonView(),
    NutritionView(),
    CoursePage(),
    FoodListPage(),
    TimerScreen(value: false,),
    FoodCalculator(mealCategory: ''),
    VitaminView(),
    SettingsPage(),

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height:10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem(
                    index: 0,
                    label: 'Home',
                    path: SizedBox(

                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/muscle Home.png')))),
                _buildTabItem(
                    index: 1,
                    label: 'exercise',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/dumbbell home.png')))),
                _buildTabItem(
                    index:2,
                    label: 'nutrition',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/nutrition.png')))),_buildTabItem(
                    index:3,
                    label: 'Courses',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/courses.png')))),
                _buildTabItem(
                    index: 4,
                    label: 'Alarms',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/food-safety home.png')))),
              ],
            ),
            SizedBox(
              height:10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem(
                    index: 5,
                    label: 'Remider',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/reminder home.png')))),
                _buildTabItem(
                    index: 6,
                    label: 'Calculator',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/calculator.png')))),
                _buildTabItem(
                    index: 7,
                    label: 'Vitamins',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/Vitamis.png')))),
                _buildTabItem(
                    index: 8,
                    label: 'Tab 6',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                            AssetImage('assets/images/settings home.png')))),

              ],
            ),

          ],
        ),
      ),
    );
  }

   Widget _buildTabItem(
      {required int index, required final String label, required final Widget path}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          path,
          SizedBox(
            height:3.5,
          ),
           Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
