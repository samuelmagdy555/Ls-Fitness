import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import 'Featrue/MainLayout/view/Exercise/view/exercise.dart';
import 'Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculator.dart';
import 'Featrue/MainLayout/view/Home/View/HomeScreen.dart';
import 'Featrue/MainLayout/view/Meals/view/meals.dart';
import 'Featrue/MainLayout/view/Settings/view/Settings.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    WorkoutScreen(),
    FoodListPage(),
    TimerScreen(
      value: false,
    ),
    FoodCalculator(mealCategory: ''),
    SettingsPage(),
    SettingsPage(),
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
                    label: 'Progress',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                                AssetImage('assets/images/dumbbell home.png')))),
                _buildTabItem(
                    index: 2,
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
                    index: 3,
                    label: 'Tab 4',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                                AssetImage('assets/images/reminder home.png')))),
                _buildTabItem(
                    index: 4,
                    label: 'Tab 5',
                    path: SizedBox(
                        height: height * .03,
                        width: width * .11,
                        child: const Image(
                            image:
                                AssetImage('assets/images/calculator.png')))),
                _buildTabItem(
                    index: 5,
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
      {required int index, required String label, required Widget path}) {
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
