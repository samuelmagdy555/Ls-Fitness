import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: height * 0.05,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.08,
                    backgroundImage: AssetImage('assets/images/download (1).png'),
                  ),
                  SizedBox(width: width * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome youlakou',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Way to go! you’re on a hot 3-week work out streak',
                        style: TextStyle(color: Colors.white70, fontSize: width * 0.030),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              // Time to Workout Button
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'SAT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.yellow),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Time to workout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              // Guided Training Section
              Text(
                'GUIDED TRAINING',
                style: TextStyle(color: Colors.white70, fontSize: width * 0.04),
              ),
              SizedBox(height: height * 0.01),
              Stack(
                children: [
                  Container(
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/images/download.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CHEST & ARMS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05,
                          ),
                        ),
                        Container(
                          color: Colors.yellow,
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.005),
                          child: Text(
                            'Recommended',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Dynamic Warmup | 22 Minutes',
                          style: TextStyle(color: Colors.white, fontSize: width * 0.035),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              // Next Exercise Section
              Text(
                'NEXT EXERCISE',
                style: TextStyle(color: Colors.white70, fontSize: width * 0.04),
              ),
              SizedBox(height: height * 0.01),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  exerciseCard(width, '1', 'Incline Dumbbell Flyes',
                      'It works your upper and outer pecs to build a broader chest.'),
                  SizedBox(height: height * 0.01),
                  exerciseCard(width, '2', 'Cable Rope Overhead Extensions',
                      'This move works your triceps through a full range of motion.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget exerciseCard(double width, String number, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: width * 0.035,
          backgroundColor: Colors.yellow,
          child: Text(number, style: TextStyle(color: Colors.black)),
        ),
        SizedBox(width: width * 0.02),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(width * 0.03),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                  ),
                ),
                SizedBox(height: width * 0.02),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: width * 0.035),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
