import 'package:flutter/material.dart';

class BodyMeasurementsPage extends StatefulWidget {
  const BodyMeasurementsPage({Key? key}) : super(key: key);

  @override
  State<BodyMeasurementsPage> createState() => _BodyMeasurementsPageState();
}

class _BodyMeasurementsPageState extends State<BodyMeasurementsPage> {
  final List<String> measurements = ["thighs", "duck", "neck", "chest", "waist", "hand"];
  String selectedMeasurement = "thighs";
  double measurementValue = 0;

  final Map<String, double> savedValues = {
    "thighs": 0,
    "duck": 0,
    "neck": 0,
    "chest": 0,
    "waist": 0,
    "hand": 0,
  };

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // خلفية الصفحة
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    "Body Dimensions Measurement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/body.png',
                              height: screenHeight * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              "Choose the measurement",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: DropdownButton<String>(
                                value: selectedMeasurement,
                                isExpanded: true,
                                underline: Container(),
                                items: measurements.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.04,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMeasurement = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Column(
                    children: [
                      Text(
                        "$selectedMeasurement: ${measurementValue.toStringAsFixed(1)}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        value: measurementValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[300],
                        onChanged: (double value) {
                          setState(() {
                            measurementValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.12, vertical: screenHeight * 0.02),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.blueAccent.withOpacity(0.5),
                      elevation: 10,
                    ),
                    onPressed: () {
                      setState(() {
                        savedValues[selectedMeasurement] = measurementValue;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "تم حفظ قيمة $selectedMeasurement: ${measurementValue.toStringAsFixed(1)}",
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: savedValues.keys.map((muscle) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              muscle,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${savedValues[muscle]!.toStringAsFixed(1)}",
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
