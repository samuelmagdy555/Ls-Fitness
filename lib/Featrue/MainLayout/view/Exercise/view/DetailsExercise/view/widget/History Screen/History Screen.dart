import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/Model/PrgoressModel.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  final List<Volumes> volumes;

  const HistoryScreen({super.key, required this.volumes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: volumes.length,
      itemBuilder: (context, index) {
        final entry = volumes[index];
        DateTime date = DateTime.parse(entry.date);
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
                  '${entry.volume} KG',
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
      },
    );
  }
}
