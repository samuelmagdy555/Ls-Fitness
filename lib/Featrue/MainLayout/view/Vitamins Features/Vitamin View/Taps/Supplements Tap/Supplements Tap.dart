import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../../../../Core/Constant/Loading Indicator/Loading indecator.dart';
import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import '../../Supplement Details/Supplement Details.dart';

class SupplementsTap extends StatefulWidget {
  const SupplementsTap({super.key});

  @override
  State<SupplementsTap> createState() => _SupplementsTapState();
}

class _SupplementsTapState extends State<SupplementsTap> {

  late NumberPaginatorController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = NumberPaginatorController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
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

              child: Column(
                children: [
                  SizedBox(
                    height: height * .02,
                  ),
                  VitaminScreenCubit.get(context)
                      .supplementModel!
                      .data!
                      .isNotEmpty
                      ? NumberPaginator(
                    showNextButton: true,
                    showPrevButton: true,

                    controller: controller,
                    numberPages: VitaminScreenCubit.get(context)
                        .supplementModel
                        ?.paginationResult
                        ?.numberOfPages ??
                        0,
                    onPageChange: (int index) {
                      VitaminScreenCubit.get(context).changeVitaminsPage(
                          controller: controller, index: index);

                    },
                  )
                      : Center(
                    child: Text('',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Expanded(
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
                                    top: height*.15,
                                    right: width*.2,
                                    left: width*.2,
                                    child: Container(
                                      width: width * .45,
                                      height: height * .0775,
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
                                    top: height*.325,
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
                    
                                    top: height*.45,
                                    right: width*.075,
                                    left: width*.075,
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
                                        height: height*.0775,
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
                  ),
                ],
              ),
            );
      },
    );
  }
}
