import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../onboarding/View/Widget/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _buildBackgroundImage(),
                _buildTitleSubtitle(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLoginForm(),
                  const SizedBox(height: 15),
                  _buildForgetButton(),
                  const SizedBox(height: 15),
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Get.to(() => ForgetPasswordPage());
        },
        child: const Text(
          "ForgetPassword?",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel("Email"),
        _buildTextField(hintText: "Enter Your Email"),
        const SizedBox(height: 20),
        _buildInputLabel("Password"),
        _buildTextField(hintText: "*******", obscureText: true),
      ],
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  Widget _buildTextField({required String hintText, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildActionButton(
            text: "Login",
            backgroundColor: kFirstColor,
            onPressed: () {
              // Get.to(() => LoginPage());
            },
          ),
          const SizedBox(height: 10),
          _buildActionButton(
            text: "Sign Up",
            backgroundColor: kThirdColor,
            borderColor: kFirstColor,
            onPressed: () {
              // Get.to(() => SignUpPage());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(width: 1, color: borderColor)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSubtitle() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [kThirdColor, Colors.transparent],
        ),
      ),
      height: Get.height * 0.55,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                text: 'HARD\t',
                style: TextStyle(
                  fontFamily: "Bebas",
                  fontSize: 30,
                  letterSpacing: 5,
                ),
                children: [
                  TextSpan(
                    text: 'ELEMENT',
                    style: TextStyle(color: kFirstColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Train and live the new experience of exercising at home",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      height: Get.height * 0.55,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/12.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


