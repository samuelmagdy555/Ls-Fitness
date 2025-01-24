import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/View/Contact.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

import '../View Model/trainer_request_cubit.dart';
import 'CoachRequestEmail.dart';
import 'CoachRequestPhone.dart';


class CoachRequestEmail extends StatefulWidget {
  const CoachRequestEmail({super.key});


  @override
  State<CoachRequestEmail> createState() => _CoachRequestEmailState();
}


class _CoachRequestEmailState extends State<CoachRequestEmail> {
  final TextEditingController EmailController = TextEditingController();
  bool isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    EmailController.addListener(() {
      setState(() {
        isButtonEnabled = EmailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    EmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;


    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: size.height*0.05 ,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child:  ProgressSingleIndicatorWidget(
                currentStep: 1,
                totalSteps: 10,

              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: size.height * 0.027,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Nationalty.png',
                    width: size.width,
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.4),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08, vertical: size.height * 0.05),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Enter Your E-Mail",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            TextFormField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,

                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                prefixIcon: Icon(Icons.email, color: Colors.blue),
                              ),
                            ),
                            SizedBox(height: size.height * 0.2),
                            ElevatedButton(
                              onPressed: isButtonEnabled
                                  ? () {
                                TrainerRequestCubit.get(context).trainerEmail = EmailController.text;
                                print(
                                    TrainerRequestCubit.get(context).trainerName);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoachRequestPhone(),
                                  ),
                                );
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.3, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor:
                                isButtonEnabled ? Colors.black : Colors.grey,
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
