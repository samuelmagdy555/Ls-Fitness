import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordsScreen extends StatelessWidget {
  final String MaxVolume;
  final String MaxVolumeDate;

  const RecordsScreen({super.key, required this.MaxVolume, required this.MaxVolumeDate});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
      DateTime date = DateTime.parse(MaxVolumeDate);

      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0 , left: 16),
              child: Text(
                'Volume Tracking',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ListTile(
              title: Text(
                'MaxVolume : ${MaxVolume}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              subtitle: Text(
                DateFormat('MMM d, yyyy - HH:mm').format(date),
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );
    },);
  }
}
