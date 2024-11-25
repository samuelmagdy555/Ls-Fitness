import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/ChangePassword/view/ChangePassword.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/EditProfile/View/EditProfile.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/view/Profile.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Step%20Counter/StepsCounter.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final width = mediaQuery.width;
    final height = mediaQuery.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings', style: TextStyle(fontSize: width * 0.06,color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.05,
        ),
        child: ListView(
          children: [
            _buildSettingsItem(
              context,
              icon: Icons.person,
              label: 'My Profile',
              onTap: () => _navigateToPage(context, ProfilePage(),


              ),
            ),
            _buildSettingsItem(
              context,
              icon: Icons.change_circle,
              label: 'Change Password',
              onTap: () => _navigateToPage(context, ChangePasswordScreen()),
            ),
            _buildSettingsItem(
              context,
              icon: Icons.volume_up,
              label: 'Sounds',

            ),
            _buildSettingsItem(
              context,
              icon: Icons.plus_one,
              label: 'Steps Counter',
              onTap: () => _navigateToPage(context, StepCounterPage()),
            ),
            _buildSettingsItemWithButton(
              context,
              icon: Icons.edit,
              label: 'Edit Profile',
              buttonLabel: 'Edit',
              onTap: () => _navigateToPage(context, EditProfilePage()),
            ),

            _buildSettingsItemWithButton(
              context,
              icon: Icons.language,
              label: 'Language',
              buttonLabel: 'Change',

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon, required String label,  VoidCallback? onTap}) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurpleAccent, size: width * 0.08),
        title: Text(label, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: width * 0.05),
        onTap: onTap,
        tileColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildSettingsItemWithButton(BuildContext context,
      {required IconData icon, required String label, String? description, String? buttonLabel, VoidCallback? onTap}) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple, size: width * 0.08),
        title: Text(label, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
        subtitle: description != null
            ? Text(description, style: TextStyle(color: Colors.red, fontSize: width * 0.04))
            : null,
        trailing: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(buttonLabel!, style: TextStyle(color:Colors.deepPurple, fontSize: width * 0.04)),
        ),
        tileColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
