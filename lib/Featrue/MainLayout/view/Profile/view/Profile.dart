import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Intro Feature/onboarding/View/Screens/Onboarding_Screen.dart';
import '../ChangePassword/view/ChangePassword.dart';
import '../EditProfile/View/EditProfile.dart';
import '../view_model/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    super.initState();
    ProfileCubit.get(context).myProfile();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        var userData = cubit.profileModel?.data;

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(currentState['backgroundImage']),
              //     // مسار الصورة
              //     fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
              //   ),
              // ),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [

            ],
          ),
          backgroundColor: kThirdColor,
          body: Container(
            height: double.infinity,
            width: double.infinity,

            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(currentState['backgroundImage']),
            //       fit: BoxFit.cover),
            // ),

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.1,
                          backgroundImage: AssetImage(
                              'assets/images/weightlifting_10968103.gif'),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData?.username ?? ProfileCubit.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: screenWidth * 0.07,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileDetail(
                              Icons.email, "Email", userData?.email ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.phone, "Phone", userData?.phone ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.plus_one, "age", userData?.goalsData.age
                              .toString() ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.plus_one, "Length", userData?.goalsData.height ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.merge_type, "Gender", userData?.goalsData.gender ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.monitor_weight_outlined, "weight",
                              userData?.goalsData.weight ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.monitor_weight_outlined, "Target weight",
                              userData?.goalsData.targetWeight ?? '', screenWidth),


                          // profileDetail(Icons.calendar_today, "Age", userData?.age.toString() ?? '', screenWidth),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.07),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileDetail(
                              Icons.streetview, "Address", userData?.goalsData.address ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.flag, "Nationality", userData?.goalsData.nationality ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.directions_walk, "Walk Daily", userData?.goalsData.walkDaily
                              .toString() ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.loop, "Work Routine", userData?.goalsData.workRoutine ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.plus_one, "Fitness Level", userData?.goalsData.fitnessLevel ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.sports_football_rounded, "Main Goal",
                              userData?.goalsData.mainGoal ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.monitor_weight_outlined, "Allergic Substances ",
                              userData?.goalsData.allergicSubstances ?? '', screenWidth),


                          // profileDetail(Icons.calendar_today, "Age", userData?.age.toString() ?? '', screenWidth),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileDetail(
                              Icons.streetview, "injuries", userData?.goalsData.injuries.toString() ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.flag, "Exercise Preference", userData?.goalsData.exercisePreference ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.directions_walk, "Training Number Days", userData?.goalsData.trainingNumberDays
                              .toString() ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.loop, "Training Days", userData?.goalsData.trainingDays.toString() ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.plus_one, "Diets", userData?.goalsData.diets ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.sports_football_rounded, "Fitness Equipment",
                              userData?.goalsData.fitnessEquipment ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.monitor_weight_outlined, "Training Time",
                              userData?.goalsData.trainingTime ?? '', screenWidth),


                          // profileDetail(Icons.calendar_today, "Age", userData?.age.toString() ?? '', screenWidth),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileDetail(
                              Icons.streetview, "Hear Us", userData?.goalsData.hearUs ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.flag, "Location Of Training", userData?.goalsData.locationOfTraining ?? '',
                              screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(Icons.directions_walk, "Experience Issues", userData?.goalsData.experienceIssues
                              .toString() ?? '', screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          profileDetail(
                              Icons.loop, "Training Break", userData?.goalsData.trainingBreak ?? '',
                              screenWidth),

                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.07),




                    // Sign Out Button
                    ElevatedButton.icon(
                      onPressed: () {
                        CashHelper.deleteAll();
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) =>
                            WelcomeView()), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE63946),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.2,
                        ),
                      ),
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget profileDetail(IconData icon, String label, String value,
      double screenWidth) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70),
        SizedBox(width: screenWidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white70,
                fontSize: screenWidth * 0.035,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget optionRow(IconData icon, String label, double screenWidth) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: screenWidth * 0.03),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.045,
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: Colors.white70,
            size: screenWidth * 0.04),
      ],
    );
  }

  Widget optionRowWithNavigation(IconData icon, String label,
      double screenWidth, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: screenWidth * 0.03),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.white70,
              size: screenWidth * 0.04),
        ],
      ),
    );
  }
}
