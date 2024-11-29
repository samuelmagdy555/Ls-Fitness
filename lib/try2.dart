import 'package:flutter/material.dart';




class VerticalTimeline extends StatelessWidget {
  final List<String> steps = ["PATTERN", "GOAL", "USERS", "SUCCESS", "RESOURCES"];
  final List<bool> completed = [true, true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          return TimelineStep(
            title: index.toString(),
            isCompleted: completed[index],
            isLast: index == steps.length - 1, isNextCompleted: completed[index],
          );
        }),
      ),
    );
  }
}

class TimelineStep extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final bool isNextCompleted;
  final bool isLast;

  const TimelineStep({
    required this.title,
    required this.isCompleted,
    required this.isNextCompleted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Circle
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? Colors.purple : Colors.grey,
              ),
              alignment: Alignment.center,
              child: Text(
                (isCompleted ? title[0] : (title[0])).toUpperCase(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            // Line below the circle (if not last)
            if (!isLast)
              Container(
                width: 4,
                height: 50,
                color: isNextCompleted ? Colors.purple : Colors.grey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Title
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isCompleted ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
