import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'dart:convert';

import 'package:lsfitness/Featrue/MainLayout/view/trainer%20Feature/View%20Model/trainer_cubit.dart';

import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../Model/All Trainer Model/All Trainer Model.dart';
import 'Trainer Detailes/Trainer Details.dart'; // For JSON decoding.

class TrainerPage extends StatefulWidget {
  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<ThemesCubit>().state;

    return BlocConsumer<TrainerCubit, TrainerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return TrainerCubit.get(context).trainerModel != null
            ? Scaffold(
                appBar: AppBar(
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(currentState['backgroundImage']),

                        fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
                      ),
                    ),
                  ),
                  title: Text('Trainers'),
                  centerTitle: true,
                ),
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(currentState['backgroundImage']),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount:
                          TrainerCubit.get(context).trainerModel!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TrainerProfilePage()));
                            TrainerCubit.get(context).getDetailsTrainerData(
                                id: TrainerCubit.get(context)
                                    .trainerModel!
                                    .data![index]
                                    .id);
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Iconsax.user, size: 80),
                                  SizedBox(height: 10),
                                  Text(
                                    TrainerCubit.get(context)
                                        .trainerModel!
                                        .data![index]
                                        .name,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    TrainerCubit.get(context)
                                        .trainerModel!
                                        .data![index]
                                        .bio,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Experience: ${TrainerCubit.get(context).trainerModel!.data![index].yearsOfExperience.toString()} Years',
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    TrainerCubit.get(context)
                                        .trainerModel!
                                        .data![index]
                                        .location,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(currentState['backgroundImage']),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: MyLoadingIndicator(height: 100, color: Colors.red)));
        ;
      },
    );
  }
}
