import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String selectedCountryCode = "ID";
  String selectedCountryFlag = '🇮🇩';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.09,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: AssetImage('assets/images/weightlifting_10968103.gif'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Change Photo Profile",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // First Name and Last Name Fields
              buildTextField("Firstname", firstNameController, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildTextField("Lastname", lastNameController, screenWidth),
              SizedBox(height: screenHeight * 0.02),

              // Username Field
              buildTextField("Username", usernameController, screenWidth),
              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountryCode = country.countryCode;
                            selectedCountryFlag = country.flagEmoji;
                          });
                        },
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.2,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Color(0xFF1F1F3F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          selectedCountryFlag + " +" + Country.tryParse(selectedCountryCode)!.phoneCode ?? "",
                          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: buildTextField("Phone Number", phoneController, screenWidth, isPhoneNumber: true),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              buildTextField("Date of Birth", birthDateController, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Gender",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFF1F1F3F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Color(0xFF1F1F3F),
                value: 'Male',
                items: ['Male', 'Female',]
                    .map((label) => DropdownMenuItem(
                  child: Text(label, style: TextStyle(color: Colors.white)),
                  value: label,
                ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: screenHeight * 0.04),

              // Save Profile Button
              ElevatedButton(
                onPressed: () {
                  // إجراء حفظ البيانات
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                  minimumSize: Size(screenWidth, 50),
                ),
                child: Text(
                  "Save Profile",
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
    );
  }

  // Helper method to build a text field with consistent styling
  Widget buildTextField(String label, TextEditingController controller, double screenWidth, {bool isPhoneNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isPhoneNumber ? TextInputType.phone : TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF1F1F3F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
