import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';

import '../Model/mode.dart';
import 'Progress Feature/View/Progress Screen/Progress Screen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hey,",
                          style: GoogleFonts.bebasNeue(
                            fontSize: width * 0.08,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        Text(
                          ProfileCubit.get(context).profileModel!.data.username,
                          style: GoogleFonts.bebasNeue(
                            fontSize: width * 0.08,
                            color: Color(0xFF40D876),
                            letterSpacing: 1.8,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.1, // Adjust width
                      height: width * 0.1, // Adjust height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(
                          width: 3,
                          color: Color(0xFF40D876),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/emely.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Container(
                  width: width * 0.15,
                  height: width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Center(
                    child: Container(
                      height: width * 0.12,
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFF40D876),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: width * 0.1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Find ",
                          style: GoogleFonts.lato(
                            fontSize: width * 0.065,
                            color: Color(0xFF40D876),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "your Workout",
                          style: GoogleFonts.lato(
                            fontSize: width * 0.065,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.filter_alt_outlined,
                      size: width * 0.1,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: width * 0.9, // Adjust width
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color(0xFF232441),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "SEARCH WORKOUT",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Hard workout",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Full body",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Crossfit",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, left: width * 0.05),
                child: Row(
                  children: [
                    Text(
                      "Your Progress",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.08,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              GestureDetector(
                onTap: () {
                  ExerciseCubit.get(context).getExercise();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgressScreen()),
                  );
                },
                child: Image(
                  image: AssetImage('assets/images/Progress.jpg'),
                  width: width * 0.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
