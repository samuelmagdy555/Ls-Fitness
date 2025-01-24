import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../MainLayout/view/MainLayOut.dart';

class TrainerRequestSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon
            SvgPicture.asset(
              'assets/icons/success-icon.svg',
              width: 120,
              height: 120,
            ),

            // Spacing
            SizedBox(height: 30),

            // Success Title
            Text(
              'تم إرسال الطلب بنجاح',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),

            // Success Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                'سيتم مراجعة طلبك من قبل فريقنا. سنقوم بالتواصل معك قريبًا.',
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
                backgroundColor: Colors.green[600],
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