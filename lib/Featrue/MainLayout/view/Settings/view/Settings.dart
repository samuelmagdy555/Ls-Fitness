import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/ChangePassword/view/ChangePassword.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/EditProfile/View/EditProfile.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/view/Profile.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Step%20Counter/StepsCounter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes.dart';
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';

import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../Change Theme/Change Theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    // التحقق من نوع الـ Theme الحالي وتحديد قيمة isDarkMode
    isDarkMode = ThemesCubit.get(context).currentTheme == ThemesClass.manDarkTheme;
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    ThemesCubit.get(context).changeTheme(
      newTheme: isDarkMode ? ThemesClass.manDarkTheme : ThemesClass.manLightTheme,
      newBackgroundImage: isDarkMode ? 'assets/images/77.jpg' : 'assets/images/7.jpg',
    );
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          child: ListView(
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  )
                  ,
                  Text(
                    "    Settings",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildSettingsItem(
                context,
                icon: Icons.person,
                label: 'My Profile',
                onTap: () => _navigateToPage(context, ProfilePage()),
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

              ListTile(
                leading:  Icon(
                  isDarkMode
                      ? Iconsax.moon4
                      : Iconsax.sun_1,
                  size: width * 0.08,
                ),
                style:  ListTileStyle.drawer,
                title: Text(
                  'Theme',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    _toggleTheme();
                  },
                ),
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
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon, required String label, VoidCallback? onTap}) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: width * 0.08),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            ),
        onTap: onTap,
        tileColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildSettingsItemWithButton(BuildContext context,
      {required IconData icon,
      required String label,
      String? description,
      String? buttonLabel,
      VoidCallback? onTap}) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon,  size: width * 0.08),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge
        ),
        subtitle: description != null
            ? Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge
              )
            : null,
        trailing: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.black),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            buttonLabel!,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15
            )
          ),
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
