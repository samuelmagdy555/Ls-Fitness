import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/goals/View/AgeSelection.dart';
import 'package:lsfitness/Featrue/goals/Widgets/View/ProgressIndicator.dart';
import '../../Intro Feature/onboarding/View/Widget/colors.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Progress Indicator
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
              child: ProgressIndicatorWidget(
                currentStep: 4,
                totalSteps: 6,
              ),
            ),
            Text(
              "What is your gender?",
              style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.10),
            // Gender Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genderCard(
                  "Female",
                  'assets/images/Woman.png', // Update with your asset path
                  selectedGender == "Female",
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(width: screenWidth * 0.05),
                genderCard(
                  "Male",
                  'assets/images/Men.png', // Update with your asset path
                  selectedGender == "Male",
                  screenWidth,
                  screenHeight,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = "Prefer not to say";
                });
              },
              child: Text(
                "Prefer not to say",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: selectedGender == "Prefer not to say"
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedGender != null
                  ? () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AgeSelectionPage())
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3), backgroundColor: selectedGender != null ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: selectedGender != null ? Colors.black : Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget genderCard(String gender, String imagePath, bool isSelected,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.35,
              height: screenHeight * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              gender,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
