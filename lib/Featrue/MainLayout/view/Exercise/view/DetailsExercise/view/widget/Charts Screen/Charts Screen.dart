import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Progress%20Widget/Progress%20Widget.dart';

class ChartsScreen extends StatelessWidget {
  final String id;
  const ChartsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ProgressWidget(id:id );
  }
}
