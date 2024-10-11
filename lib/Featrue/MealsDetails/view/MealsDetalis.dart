import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class FoodDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  FoodDetailPage({
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(screenWidth * 0.05),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: screenHeight * 0.35,
                width: screenWidth,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
