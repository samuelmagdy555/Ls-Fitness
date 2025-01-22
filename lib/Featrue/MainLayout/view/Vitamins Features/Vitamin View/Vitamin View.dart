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


}
