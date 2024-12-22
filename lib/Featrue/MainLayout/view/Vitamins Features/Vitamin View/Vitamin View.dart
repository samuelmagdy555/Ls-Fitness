import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Alarms%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View/Vitamin%20Alarms.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Vitamin%20View/Taps/Vitamins%20Tap/Vitamins%20Tap.dart';
import '../../../../../../generated/l10n.dart';
import '../../Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Vitamine Alarms/View Model/vitamin_cubit.dart';
import '../Model View/vitamin_cubit.dart';
import 'Taps/Supplements Tap/Supplements Tap.dart';
import 'Vitamin Details/Vitamin Details.dart';

class VitaminView extends StatefulWidget {
  const VitaminView({super.key});

  @override
  State<VitaminView> createState() => _VitaminViewState();
}

class _VitaminViewState extends State<VitaminView> {
  final List<String> vitamins = const [
    'Vitamin A',
    'Vitamin B',
    'Vitamin C',
    'Vitamin D',
    'Vitamin E',
    'Vitamin K',
    'Omega 3',
  ];

  final List<String> supplements = const [
    'Protein Powder',
    'Creatine',
    'Fish Oil',
    'BCAA',
    'Multivitamin',
    'Iron',
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
    'fatty fish like salmon and tuna , and walnuts',
  ];

  final List<String> benefits = const [
    'Helps maintain eye health and strengthens immunity',
    'Supports energy production and nervous system health',
    'Boosts immunity and maintains skin health',
    'Supports bone health and calcium absorption',
    'Protects cells from damage as an antioxidant',
    'Supports blood clotting and bone health',
    'Promotes heart health and reduces inflammation',
  ];

  final List<String> dailyAmounts = const [
    '700-900 mcg',
    '1 to 3 mg',
    '75-90 mg',
    '600-800 IU',
    '15 mg',
    '90-120 mcg',
    '90-120 mcg',
  ];

  @override
  void initState() {
    super.initState();
    VitaminScreenCubit.get(context).getAllVitamins();
    VitaminScreenCubit.get(context).getAllSupplements();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .sizeOf(context)
        .width;
    double height = MediaQuery
        .sizeOf(context)
        .height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          ),
          title: Text(
            S
                .of(context)
                .Vitamin_And_Supplements,
            style: GoogleFonts.merriweather(
              fontSize: width * .05,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: S
                  .of(context)
                  .Vitamin),
              Tab(text: S
                  .of(context)
                  .Supplements),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VitaminsTap(),
            SupplementsTap(),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List items,
      String images, List<String> dailyAmounts, List<String> benefits) {
    double width = MediaQuery
        .sizeOf(context)
        .width;
    double height = MediaQuery
        .sizeOf(context)
        .height;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VitaminDetails()));
          },
          child: Container(
            margin: EdgeInsets.all(15),
            height: height * .3,
            width: width * .65,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(125),
              border: Border.all(color: Colors.white, width: width * 0.01),
            ),
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
                        borderRadius: BorderRadius.circular(125),
                      ),
                      child: Image(
                        image: AssetImage(images[index]),
                        width: width * .4,
                        height: height * .09,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    Column(
                      children: [
                        Text(
                          items[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * .065,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dailyAmounts[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * .04,
                            fontWeight: FontWeight.bold,
                          ),
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
                      color: Colors.white,
                      fontSize: width * .045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TimerScreen(
                                  value: false,
                                )));
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Iconsax.alarm,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
