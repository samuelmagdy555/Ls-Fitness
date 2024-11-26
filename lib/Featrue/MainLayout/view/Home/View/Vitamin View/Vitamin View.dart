import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Vitamin%20View/Vitamin%20Details/Vitamin%20Details.dart';

import '../../../Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import '../../../Profile/view_model/profile_cubit.dart';

class VitaminView extends StatelessWidget {
  const VitaminView({super.key});

  final List<String> vitamins = const [
    'Vitamin A',
    'Vitamin B',
    'Vitamin C',
    'Vitamin D',
    'Vitamin E',
    'Vitamin K',
    'Omega 3',
  ];
  final List<String> images = const [
    'assets/images/Vitamin A.png',
    'assets/images/Vitamin B.png',
    'assets/images/Vitamin C.png',
    'assets/images/Vitamin D.png',
    'assets/images/Vitamin E.png',
    'assets/images/Vitamin K.png',
    'assets/images/omega 3.png',
  ];
  final List<String> locations = const [
    'carrots , sweet potatoes, and spinach',
    'meat , eggs , dairy products , and whole grains',
    'citrus fruits , strawberries , and oranges',
    'sunlight , fatty fish , and dairy products',
    'nuts , seeds , and vegetable oils',
    'leafy greens , broccoli , and Brussels sprouts',
    'fatty fish like salmon and tuna , and walnuts'
  ];
  final List<String> benefits = const [
    'Helps maintain eye health and strengthens immunity',
    'Supports energy production and nervous system health',
    'Boosts immunity and maintains skin health',
    'Supports bone health and calcium absorption',
    'Protects cells from damage as an antioxidant',
    'Supports blood clotting and bone health',
    'Promotes heart health and reduces inflammation'
  ];
  final List<String> dailyAmounts = const [
    '700-900 mcg',
    ' 1 to 3 mg',
    '75-90 mg ',
    '600-800 IU',
    '15 mg',
    '90-120 mcg',
    '90-120 mcg'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Vitamins',
              style: GoogleFonts.merriweather(
                  fontSize: width * .06,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.medication_outlined, color: Colors.white),
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Text(
                      ProfileCubit.get(context).profileModel?.data.username ??
                          '',
                      style: GoogleFonts.merriweather(
                          fontSize: width * .045,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ]),
        ),
        SizedBox(height: height * 0.025),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: vitamins.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VitaminDetails()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: height * .3,
                      width: width * .65,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(125)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: width * .42,
                                height: height * .09,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(125)),
                                child: Image(
                                  image: AssetImage(
                                    images[index],
                                  ),
                                  width: width * .4,
                                  height: height * .09,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Column(
                                children: [
                                  Text(
                                    vitamins[index],
                                    style: TextStyle(
                                        color: kThirdColor,
                                        fontSize: width * .065,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    dailyAmounts[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * .575,
                            child: Text(
                              benefits[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kThirdColor,
                                  fontSize: width * .045,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimerScreen(
                                      value: true,
                                    ),
                                  ));
                            },
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: kThirdColor,
                              child: Center(
                                  child: Icon(
                                Iconsax.alarm,
                                color: Colors.white,
                                size: 35,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ]),
    );
  }
}
