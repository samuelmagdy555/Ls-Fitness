import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/CoachRequest/View%20Model/trainer_request_cubit.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/CoachRequest/View/CoachRequestAge.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/View/Contact.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

import 'CoachRequestEmail.dart';


class CoachRequestPhone extends StatefulWidget {
  const CoachRequestPhone({super.key});


  @override
  State<CoachRequestPhone> createState() => _CoachRequestPhoneState();
}


class _CoachRequestPhoneState extends State<CoachRequestPhone> {
  final TextEditingController PhoneController = TextEditingController();
  bool isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    PhoneController.addListener(() {
      setState(() {
        isButtonEnabled = PhoneController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    PhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: size.height*0.05 ,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child:  ProgressSingleIndicatorWidget(
                currentStep: 2,
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
                    'assets/images/phone.png',
                    width: size.width,
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
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
                              "Enter Your Phone Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            TextFormField(
                              controller: PhoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,

                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                prefixIcon: Icon(Icons.phone_in_talk, color: Colors.blue),
                              ),
                            ),
                            SizedBox(height: size.height * 0.2),
                            ElevatedButton(
                              onPressed: isButtonEnabled
                                  ? () {
                                TrainerRequestCubit.get(context).trainerPhone = PhoneController.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoachAge(),
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
