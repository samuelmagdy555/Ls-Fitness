import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';

class NutritionView extends StatefulWidget {
  const NutritionView({super.key});

  @override
  State<NutritionView> createState() => _NutritionViewState();
}

class _NutritionViewState extends State<NutritionView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      body: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            borderPadding: EdgeInsets.all(6),
            dashPattern: [8, 4],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: height * .3,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/images/cloud-computing.png',
                      ),
                      fit: BoxFit.fill,
                      height: height * .15,
                      width: width * .35,
                    ),
                    SizedBox(
                      height: height * .01,),
                    Text('Add Your Image Here' ,textAlign: TextAlign.center, style:  TextStyle(color: kSecondColor , fontSize: width*.045 , fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
