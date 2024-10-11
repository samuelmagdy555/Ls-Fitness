import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/MainLayOut.dart';

import '../View_Model/edit_profile_cubit.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String selectedCountryCode = "ID";
  String selectedCountryFlag = '🇮🇩';
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainLayout()),
                  (route) => false);
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Profile Update Successfully',
              color: Colors.blue,
              message: 'Update Successful',
              contentType: ContentType.success,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Data Error'),
          ));
        } else if (state is ChangeImageSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Image Updated Successfully'),
          ));
        } else if (state is ChangeImageError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to update image'),
          ));
        }
      },
      builder: (context, state) {
        var cubit = EditProfileCubit.get(context);
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
                  GestureDetector(
                    onTap: () => pickImage(context),
                    child: CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : AssetImage('assets/images/weightlifting_10968103.gif') as ImageProvider,
                    ),
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
                  buildTextField("Email", emailController, screenWidth),
                  SizedBox(height: screenHeight * 0.02),
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
                    items: ['Male', 'Female']
                        .map((label) => DropdownMenuItem(
                      child: Text(label, style: TextStyle(color: Colors.white)),
                      value: label,
                    ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  ElevatedButton(
                    onPressed: () async {
                      await cubit.EditProfile(
                          username: usernameController.text,
                          phone: phoneController.text,
                          email: emailController.text);
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
      },
    );
  }

  void pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
      await EditProfileCubit.get(context).changeImage(
          image: profileImage!,
          username: usernameController.text,
          phone: phoneController.text,
          email: emailController.text);
    }
  }

  Widget buildTextField(String label, TextEditingController controller, double screenWidth,
      {bool isPhoneNumber = false}) {
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
