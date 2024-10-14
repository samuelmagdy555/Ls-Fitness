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
    // استخدم MediaQuery للحصول على حجم الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // قسم الصورة
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(screenWidth * 0.05), // تغيير نصف القطر بناءً على العرض
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: screenHeight * 0.35, // تغيير الارتفاع بناءً على حجم الشاشة
                width: screenWidth, // العرض متجاوب مع حجم الشاشة
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // تغيير المسافة العمودية بناءً على حجم الشاشة

            // تفاصيل الطعام
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // تغيير الحواف بناءً على العرض
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.01),

                  // اسم الطعام
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.065, // حجم الخط بناءً على العرض
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // مسافة بعد الاسم

                  // الوصف
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // حجم الخط بناءً على العرض
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
