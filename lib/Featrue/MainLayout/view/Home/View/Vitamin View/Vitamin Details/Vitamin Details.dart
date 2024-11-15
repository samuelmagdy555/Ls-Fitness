import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class VitaminDetails extends StatelessWidget {
  const VitaminDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kThirdColor,
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body:Column(
        children: [
          Container(
            height: height*.3,
            width: width,
            decoration: BoxDecoration(
                color: kSecondColor
            ),
            child: Center(
              child: Text('Video here'),
            ),
          ),

        ],
      ),
    );
  }
}
