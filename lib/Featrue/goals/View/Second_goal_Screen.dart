import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/goals/Widgets/View/ProgressIndicator.dart';

class MotivationSelectionScreen extends StatefulWidget {
  @override
  _MotivationSelectionScreenState createState() => _MotivationSelectionScreenState();
}

class _MotivationSelectionScreenState extends State<MotivationSelectionScreen> {
  // قائمة الخيارات المتاحة
  final List<Map<String, dynamic>> motivations = [
    {'text': 'Improving Health', 'icon': Icons.favorite},
    {'text': 'Boosting Immune System', 'icon': Icons.shield},
    {'text': 'Looking Better', 'icon': Icons.visibility},
    {'text': 'Building Strength and Endurance', 'icon': Icons.fitness_center},
    {'text': 'Boosting Libido', 'icon': Icons.heart_broken},
  ];

  // قائمة تحتوي على الخيارات التي تم اختيارها
  List<String> selectedMotivations = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: ProgressIndicatorWidget(
                currentStep: 2,
                totalSteps: 6,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "What motivates you to exercise?",
              style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: motivations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {

                          if (selectedMotivations.contains(motivations[index]['text'])) {
                            selectedMotivations.remove(motivations[index]['text']);
                          } else {

                            selectedMotivations.add(motivations[index]['text']);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Icon(motivations[index]['icon'], color: Colors.black),
                                SizedBox(width: screenWidth * 0.03),
                                Text(
                                  motivations[index]['text'],
                                  style: TextStyle(fontSize: screenWidth * 0.043),
                                ),
                              ],
                            ),

                            selectedMotivations.contains(motivations[index]['text'])
                                ? Icon(Icons.check_circle, color: Colors.black)
                                : Icon(Icons.circle_outlined, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: selectedMotivations.isEmpty
                  ? null
                  : () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextScreen(
                      selectedGoals: selectedMotivations,
                      currentStep: 3,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final List<String> selectedGoals;
  final int currentStep;

  NextScreen({required this.selectedGoals, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Goals"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: Container(
                    width: screenWidth * 0.12,
                    height: 5,
                    color: index < currentStep ? Colors.yellow : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "You have selected:",
                  style: TextStyle(fontSize: screenWidth * 0.06),
                ),
                SizedBox(height: 10),
                ...selectedGoals.map((goal) => Text(
                  goal,
                  style: TextStyle(fontSize: screenWidth * 0.05),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
