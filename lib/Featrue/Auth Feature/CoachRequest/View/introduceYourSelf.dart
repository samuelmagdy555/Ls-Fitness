import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/CoachRequest/View/CoachRequestAge.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

import '../View Model/trainer_request_cubit.dart';
import 'Certificatie View.dart';

class IntroduceYourSelf extends StatefulWidget {
  const IntroduceYourSelf({super.key});

  @override
  State<IntroduceYourSelf> createState() => _IntroduceYourSelfState();
}

class _IntroduceYourSelfState extends State<IntroduceYourSelf> {
  final TextEditingController IntroduceYourSelfController =
      TextEditingController();
  bool isButtonEnabled = false;
  double textFieldHeight = 60; // Default height for the text field

  @override
  void initState() {
    super.initState();
    IntroduceYourSelfController.addListener(() {
      setState(() {
        isButtonEnabled = IntroduceYourSelfController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    IntroduceYourSelfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: ProgressSingleIndicatorWidget(
              currentStep: 8,
              totalSteps: 10,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.006,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Experience.png',
                    width: size.width,
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.4,
                  maxChildSize: 0.8,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          vertical: size.height * 0.04),
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
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Text(
                            "Introduce Your Self?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                // Adjust the height based on vertical drag
                                textFieldHeight += details.delta.dy;
                                if (textFieldHeight < 60)
                                  textFieldHeight = 60; // Minimum height
                              });
                            },
                            child: Container(
                              height: textFieldHeight,
                              child: TextFormField(
                                controller: IntroduceYourSelfController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  prefixIcon: Icon(Icons.person_outline,
                                      color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.15),
                          ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                              TrainerRequestCubit.get(context)
                                  .trainerAbout =
                                  IntroduceYourSelfController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CertificatesPage(),
                                ),
                              );
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.3,
                                  vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: isButtonEnabled
                                  ? Colors.black
                                  : Colors.grey,
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
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
