import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Alarms%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View/Vitamin%20Alarms.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Vitamin%20View/Taps/Vitamins%20Tap/Vitamins%20Tap.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
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
    VitaminScreenCubit.get(context).getAllVitamins(page: '1');
    VitaminScreenCubit.get(context).getAllSupplements(page: '1');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .sizeOf(context)
        .width;
    double height = MediaQuery
        .sizeOf(context)
        .height;
    final currentState = context.watch<ThemesCubit>().state;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // خلفية شفافة
          elevation: 0, // إزالة الظل
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentState['backgroundImage']), // مسار الصورة
                fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
              ),
            ),
          ),
          title: Text(
            S.of(context).Vitamin_And_Supplements,
            style: Theme.of(context).textTheme.bodyLarge
          ),
          bottom: TabBar(
            indicatorColor: Theme.of(context).focusColor,
            labelColor: Theme.of(context).focusColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: [
              Tab(text: S.of(context).Vitamin , ),
              Tab(text: S.of(context).Supplements),
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
