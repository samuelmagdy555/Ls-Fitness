import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/goals/View/Second_goal_Screen.dart';
import 'package:lsfitness/Featrue/goals/View/injuries.dart';
import 'package:lsfitness/Featrue/goals/Widgets/View/ProgressIndicator.dart';
import '../../Intro Feature/onboarding/View/Widget/colors.dart';

class DietsPage extends StatefulWidget {
  @override
  _DietsPageState createState() => _DietsPageState();
}

class _DietsPageState extends State<DietsPage> {
  String selectedGoal = '';

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
                currentStep: 9,
                totalSteps: 10,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "Do you follow any of \n  these diets?",
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
                    'No Dietary Restrictions',
                    'assets/images/problem_9000296-removebg-preview.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Vegetation',
                    'assets/images/carrot_2524601.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Vegan',
                    'assets/images/vegan_5579100.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Keto',
                    'assets/images/avocado_4376702.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Other',
                    'assets/images/other_6874038.png',
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoalOption(BuildContext context, String title, String imagePath, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = title;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InjuriesRecently(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: selectedGoal == title ? Colors.blue : Colors.transparent,
            width: screenWidth * 0.005,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Image.asset(
                imagePath,
                color: selectedGoal == title ? Colors.blue : Colors.grey,
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
