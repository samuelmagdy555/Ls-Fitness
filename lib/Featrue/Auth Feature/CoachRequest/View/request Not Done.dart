import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/MainLayOut.dart';

class TrainerRequestAlreadySubmittedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Warning Icon
            Icon(Iconsax.warning_2, size: 100, color: Colors.orange[800]),

            // Spacing
            SizedBox(height: 30),

            // Warning Title
            Text(
              'لقد تم إرسال الطلب من قبل',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),

            // Warning Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                'لقد قمت بالفعل بإرسال طلب للتدريب. سيتم مراجعة طلبك من قبل فريقنا.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),

            // Return Home Button
            ElevatedButton(
              onPressed: () {
                // Navigate back to home or main screen
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => MainLayout())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[600],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'العودة للرئيسية',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}