import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/goals/Widgets/View/ProgressIndicator.dart';

import '../../Intro Feature/onboarding/View/Widget/colors.dart';

class AgeSelectionPage extends StatefulWidget {
  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  int selectedAge = 30;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Progress indicator
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                  child: ProgressIndicatorWidget(
                    currentStep: 5,
                    totalSteps: 6,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          // Title
          Text(
            'Body Data',
            style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Age selection header
          Text(
            'Your age',
            style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            'Age information helps us more accurately\nassess your metabolic level',
            style: TextStyle(
                fontSize: screenWidth * 0.04, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          // Age selection wheel
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: screenHeight * 0.08,
              diameterRatio: 1.5,
              perspective: 0.002,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedAge = index + 20; // Starting age from 20
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final age = index + 20; // Starting age from 20
                  return Center(
                    child: Text(
                      '$age years old',
                      style: TextStyle(
                        fontSize: age == selectedAge
                            ? screenWidth * 0.07
                            : screenWidth * 0.05,
                        fontWeight:
                        age == selectedAge ? FontWeight.bold : FontWeight.normal,
                        color: age == selectedAge
                            ? Colors.white
                            : Colors.grey.shade400,
                      ),
                    ),
                  );
                },
                childCount: 100, // Set maximum age range (100 years)
              ),
            ),
          ),
          // Continue button
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: ElevatedButton(
              onPressed: () {
                // Perform action on continue
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
