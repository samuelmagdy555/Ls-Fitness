import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/DetailsExercise/view/DetailsExercise.dart';


class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                // Responsive Background Image
                Container(
                  height: screenHeight * 0.4, // 40% of screen height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/dl.beatsnoop.com-high-a99939166bb3d697f8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Full Body Workout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Exercise 1 of 24",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // List of Exercises
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      ExerciseTile(
                        imagePath: 'assets/images/Barbell-Bench-Press.png',
                        title: "Bench Press",
                        sets: "Set 1 • 12 Reps",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetailsPage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight*.02,),
                      ExerciseTile(
                        imagePath: 'assets/images/squats.png',
                        title: "Back Squat",
                        sets: "Set 2 • 12 Reps",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetailsPage(),
                            ),
                          );
                        },
                      ),  SizedBox(height: screenHeight*.02,),

                      ExerciseTile(
                        imagePath: 'assets/images/th.jpeg',
                        title: "Overhead Press",
                        sets: "Set 3 • 12 Reps",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetailsPage(),
                            ),
                          );
                        },
                      ),SizedBox(height: screenHeight*.02,),
                      ExerciseTile(
                        imagePath: 'assets/images/th.jpeg',
                        title: "Overhead Press",
                        sets: "Set 3 • 12 Reps",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetailsPage(),
                            ),
                          );
                        },
                      ),SizedBox(height: screenHeight*.02,),
                      ExerciseTile(
                        imagePath: 'assets/images/th.jpeg',
                        title: "Overhead Press",
                        sets: "Set 3 • 12 Reps",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetailsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseTile extends StatefulWidget {
  final String imagePath;
  final String title;
  final String sets;
  final VoidCallback onPressed;

  const ExerciseTile({
    required this.imagePath,
    required this.title,
    required this.sets,
    required this.onPressed,
  });

  @override
  _ExerciseTileState createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.sets,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.play_circle_outline, color: Colors.white),
        ],
      ),
    );
  }
}


