import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class ExerciseListPage extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {'title': 'Bench Press (Barbell)', 'subtitle': 'Chest', 'image': 'assets/images/Barbell-Bench-Press.png'},
    {'title': 'Bench Press (Dumbbell)', 'subtitle': 'Chest', 'image': 'assets/images/dumbbell-bench-press-1000x1000.jpg'},
    {'title': 'Bent Over Row (Barbell)', 'subtitle': 'Upper Back', 'image': 'assets/images/f1108b035c822541061c9ccf51eb3094.jpg'},
    {'title': 'Bicep Curl (Dumbbell)', 'subtitle': 'Biceps', 'image': 'assets/images/curl-de-biceps-com-halteres-e-banda-1280x720.jpg'},
    {'title': 'Cable Fly Crossovers', 'subtitle': 'Chest', 'image': 'assets/images/Cable+Crossovers.jpeg'},
    {'title': 'Deadlift (Barbell)', 'subtitle': 'Back', 'image': 'assets/images/01e4ba76cf4508a8e39a406fdd30cd3c.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.04,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          children: [
            Text(
              "Exercise",
              style: TextStyle(
                fontSize: screenHeight * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: screenWidth * 0.07,
                        backgroundImage: AssetImage(exercises[index]['image']!),
                      ),
                      title: Text(
                        exercises[index]['title']!,
                        style: TextStyle(fontSize: screenHeight * 0.025),
                      ),
                      subtitle: Text(
                        exercises[index]['subtitle']!,
                        style: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: screenHeight * 0.025),
                      onTap: () {
                        // Navigate to details page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailPage(
                              title: exercises[index]['title']!,
                              image: exercises[index]['image']!,
                              subtitle: exercises[index]['subtitle']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const ExerciseDetailPage({required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(image),
            SizedBox(height: 20),
            Text(
              subtitle,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
