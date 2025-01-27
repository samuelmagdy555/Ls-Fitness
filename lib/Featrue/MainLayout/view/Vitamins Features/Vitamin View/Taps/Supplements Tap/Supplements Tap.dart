import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';

import '../../../../../../../Core/Constant/Loading Indicator/Loading indecator.dart';
import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import '../../Supplement Details/Supplement Details.dart';

class SupplementsTap extends StatelessWidget {
  const SupplementsTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return BlocConsumer<VitaminScreenCubit, VitaminScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final currentState = context.watch<ThemesCubit>().state;

        return VitaminScreenCubit.get(context).supplementModel == null
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
                  padding: EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  itemCount: VitaminScreenCubit.get(context)
                      .supplementModel!
                      .data
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          VitaminScreenCubit.get(context).getSpecificSupplements(
                              id: VitaminScreenCubit.get(context)
                                  .supplementModel!
                                  .data[index]
                                  .id
                                  .toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SupplementDetails()));
                        },
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/Supplement Shape.png'),
                              height: height * .65,
                              width: width * .75,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: height*.17,
                              right: width*.18,
                              left: width*.18,
                              child: Container(
                                width: width * .45,
                                height: height * .08,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius: BorderRadius.circular(125),
                                ),
                                child: Image(
                                  image: NetworkImage(
                                      'https://api.ls-fitnes.com/vitamins/1.webp'),
                                  width: width * .4,
                                  height: height * .09,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              top: height*.36,
                              right: width*.2,
                              left: width*.2,
                              child: SizedBox(
                                width: width * .575,
                                child: Text(
                                  VitaminScreenCubit.get(context)
                                      .supplementModel!
                                      .data[index]
                                      .description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium
                                ),
                              ),
                            ),
                            Positioned(

                              top: height*.515,
                              right: width*.065,
                              left: width*.065,
                              child:  InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimerScreen(
                                            value: false,
                                          )));
                                },
                                child: Container(
                                  height: height*.08,
                                  width: width*.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Iconsax.alarm,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ),
                            )

                          ],
                        ));
                  },
                ),
            );
      },
    );
  }
}
