import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View%20Model/vitamin_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Vitamin%20View/Vitamin%20Details/Vitamin%20Details.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Alarm Feature/View/Alarms Screen/Alarms Screen.dart';

class VitaminsTap extends StatelessWidget {
  const VitaminsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VitaminScreenCubit, VitaminScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        double width = MediaQuery.sizeOf(context).width;
        double height = MediaQuery.sizeOf(context).height;
        final currentState = context.watch<ThemesCubit>().state;

        return VitaminScreenCubit.get(context).vitaminsModel == null
            ? Center(
                child: MyLoadingIndicator(
                    height: height * .3, color: kSecondColor),
              )
            : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(currentState['backgroundImage']),
                fit: BoxFit.cover),
          ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      VitaminScreenCubit.get(context).vitaminsModel!.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        VitaminScreenCubit.get(context).getSpecificVitamin(
                            id: VitaminScreenCubit.get(context)
                                .vitaminsModel!
                                .data[index]
                                .id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VitaminDetails(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: height * .3,
                        width: width * .65,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(125),
                          border: Border.all(
                              color: Theme.of(context).focusColor, width: width * 0.01),
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
                                    image: NetworkImage(
                                        VitaminScreenCubit.get(context)
                                            .vitaminsModel!
                                            .data[index]
                                            .image),
                                    width: width * .4,
                                    height: height * .09,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              width: width * .575,
                              child: Text(
                                VitaminScreenCubit.get(context)
                                    .vitaminsModel!
                                    .data[index]
                                    .description,
                                maxLines: 7,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TimerScreen(
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
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            );
      },
    );
  }
}
