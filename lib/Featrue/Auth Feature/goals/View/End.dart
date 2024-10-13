import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/MainLayOut.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
            _controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'thanks for your time',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // مسافة بين النص وعلامة الصح
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (GoalsCubit.get(context).selectedWeight != null &&
                      GoalsCubit.get(context).selectedTargetweight != null &&
                      GoalsCubit.get(context).selectedAge != null &&
                      GoalsCubit.get(context).selectedLength != null &&
                      GoalsCubit.get(context).selectedGender != null) {

                    GoalsCubit.get(context).MyGoals(
                      weight: GoalsCubit.get(context).selectedWeight!,
                      Targetweight: GoalsCubit.get(context).selectedTargetweight!,
                      age: int.tryParse(GoalsCubit.get(context).selectedAge!) ?? 0,  // Handle null/invalid age
                      length: GoalsCubit.get(context).selectedLength!,
                      gender: GoalsCubit.get(context).selectedGender!,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainLayout(),
                      ),
                    );
                  } else {
                    // Show an error message or handle the missing data case
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please complete all fields')),
                    );
                  }
                },

                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
