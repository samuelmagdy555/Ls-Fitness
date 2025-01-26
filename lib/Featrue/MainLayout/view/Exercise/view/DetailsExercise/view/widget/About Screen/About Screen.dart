import 'package:flutter/material.dart';

import '../../../View Model/exercises_details_cubit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  Column(
        children: [
          SizedBox(
            child: Text('Instruction' , style: Theme.of(context).textTheme.bodyMedium,),
          ),
          SizedBox(
            child: Text(ExercisesDetailsCubit.get(context)
                .exerciseDetailsModel!
                .data
                .Description ??
                ''),
          )
        ],
      )
    );
  }
}
