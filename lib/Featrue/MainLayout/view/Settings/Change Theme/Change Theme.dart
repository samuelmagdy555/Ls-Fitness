import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes.dart';
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';

class ThemeSwitcherPage extends StatefulWidget {
  @override
  _ThemeSwitcherPageState createState() => _ThemeSwitcherPageState();
}

class _ThemeSwitcherPageState extends State<ThemeSwitcherPage> {
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
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']), // مسار الصورة
              fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
            ),
          ),
        ),
        title: Text('Theme Switcher'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Card(
            child: ListTile(
              style:  ListTileStyle.drawer,
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  _toggleTheme();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
