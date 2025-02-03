import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Themes/Themes Cubit/themes_cubit.dart';

class MyLoadingIndicator extends StatelessWidget {
  final double height;
  final Color color;

  const MyLoadingIndicator({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    final currentState = context
        .watch<ThemesCubit>()
        .state;
    return AnimatedLoadingJumpingDots(
      numberOfDots: 3,
      jumpingHeight: height * .0275,
      color: Theme.of(context).secondaryHeaderColor,
      speed: const Duration(milliseconds: 500),
    );
  }
}
