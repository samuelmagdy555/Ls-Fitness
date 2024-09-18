import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  ProgressIndicatorWidget({required this.currentStep, required this.totalSteps});

  @override
  State<ProgressIndicatorWidget> createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.totalSteps, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: screenWidth * 0.12,
            height: screenHeight * 0.015,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: index < widget.currentStep
                  ? LinearGradient(
                colors: [Colors.yellow, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  : LinearGradient(
                colors: [Colors.grey.shade300, Colors.grey.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                if (index < widget.currentStep)
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
