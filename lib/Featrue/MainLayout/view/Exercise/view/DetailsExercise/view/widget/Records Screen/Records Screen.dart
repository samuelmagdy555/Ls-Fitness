import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../Home/View/Progress Feature/View Model/progress_cubit.dart';

class RecordsScreen extends StatefulWidget {
  final String? MaxVolume;
  final String? MaxVolumeDate;

  const RecordsScreen({super.key,  this.MaxVolume,  this.MaxVolumeDate});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  String MaxVolume = '0';
  String MaxVolumeDate = '';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
      DateTime date = DateTime.parse(widget.MaxVolumeDate??'');

      return Card(
        child: SizedBox(),
      );
    },);
  }
}
