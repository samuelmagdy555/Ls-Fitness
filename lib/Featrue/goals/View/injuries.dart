import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/goals/View/Rate.dart';
import 'package:lsfitness/Featrue/goals/View/Second_goal_Screen.dart';
import 'package:lsfitness/Featrue/goals/Widgets/View/ProgressIndicator.dart';
import '../../Intro Feature/onboarding/View/Widget/colors.dart';

class InjuriesRecently extends StatefulWidget {
  @override
  _InjuriesRecentlyState createState() => _InjuriesRecentlyState();
}

class _InjuriesRecentlyState extends State<InjuriesRecently> {
  List<String> selectedGoals = []; // قائمة لتخزين الأهداف المحددة

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: ProgressIndicatorWidget(
                currentStep: 10,
                totalSteps: 10,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "Have you suffered any \n  injuries recently?",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                children: [
                  buildGoalOption(
                    context,
                    'None. I am healthy',
                    'assets/images/problem_9000296-removebg-preview.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Shoulder',
                    'assets/images/neck_14437219.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Back',
                    'assets/images/back_7922309.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Waist',
                    'assets/images/man_2844017.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Wrist',
                    'assets/images/dumbbell_14953053.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Knee',
                    'assets/images/bone_15901985.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Leg',
                    'assets/images/liposuction_7294775.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Ankle',
                    'assets/images/ankle_5800147.png',
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: ElevatedButton(
                onPressed: selectedGoals.isNotEmpty
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RateFitnessPage(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGoals.isNotEmpty ? Colors.black : Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: selectedGoals.isNotEmpty ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildGoalOption(BuildContext context, String title, String imagePath, double screenWidth, double screenHeight) {
    bool isSelected = selectedGoals.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedGoals.remove(title);
          } else {
            selectedGoals.add(title);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: screenWidth * 0.005,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Image.asset(
                imagePath,
                color: isSelected ? Colors.blue : Colors.grey,
                width: screenWidth * 0.07,
                height: screenWidth * 0.06,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
