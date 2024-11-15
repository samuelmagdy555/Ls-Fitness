import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Vitamin%20View/Vitamin%20View.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';

import '../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Model/mode.dart';
import 'FoodCalculator/view/FoodCalculator.dart';
import 'Nutrition Feature/View/Nutrition View.dart';
import 'Progress Feature/View Model/progress_cubit.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/home background.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        color: Colors.black87.withOpacity(.8),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    top: 10,
                    child: Row(
                      children: [
                        Text(
                          "Hey,",
                          style: GoogleFonts.bebasNeue(
                            fontSize: width * 0.08,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Text(
                              ProfileCubit.get(context)
                                      .profileModel
                                      ?.data
                                      .username ??
                                  '',
                              style: GoogleFonts.bebasNeue(
                                fontSize: width * 0.08,
                                color: Color(0xFF40D876),
                                letterSpacing: 1.8,
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),


                  Positioned(
                    right: width*.2,
                    left: width*.2,
                    top: height*.135,
                    child: CircleAvatar(
                      radius: width*.075,
                      backgroundColor: kSecondColor,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: width * 0.1,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   child: Container(
                  //     height: height*.03,
                  //     width: width,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black38.withOpacity(0.06),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black38,
                  //           blurRadius: 10,
                  //           spreadRadius: 7,
                  //         ),
                  //       ]
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.01),
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
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  width: width * 0.9, // Adjust width
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.black,
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> VitaminView())
                        );
                      },
                      child: Text(
                        "Vitamins",
                        style: GoogleFonts.lato(
                          fontSize: width * 0.04,
                          color: kSecondColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> FoodCalculator(mealCategory: '',))
                        );
                      },
                      child: Text(
                        "Food Calculator",
                        style: GoogleFonts.lato(
                          fontSize: width * 0.04,
                          color: kSecondColor,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> NutritionView())
                        );
                      },
                      child: Text(
                        "Nutrition",
                        style: GoogleFonts.lato(
                          fontSize: width * 0.04,
                          color: kSecondColor,
                            fontWeight: FontWeight.bold

                        ),
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
                      "Your ",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Progress",
                      style: GoogleFonts.lato(
                        fontSize: width * 0.08,
                        color: kSecondColor,
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
                onTap: () async{
                 await  ExerciseCubit.get(context).getExercise();
                 await ProgressCubit.get(context).getExercisesProgress(id: ExerciseCubit.get(context).exercisesModel!.data![0].id!);
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
