import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';

class ThemeSettingsTile extends StatefulWidget {
  @override
  State<ThemeSettingsTile> createState() => _ThemeSettingsTileState();
}

class _ThemeSettingsTileState extends State<ThemeSettingsTile> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // استخدام BlocBuilder للاستماع للتغييرات في الثيم
    return BlocBuilder<ThemesCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final bool isDark = state['isDark'];
        final bool isMan = state['isMan'];

        return ListTile(
          leading: Icon(
            isDark ? Iconsax.moon4 : Iconsax.sun_1,
            size: width * 0.08,
          ),
          style: ListTileStyle.drawer,
          title: Text(
            'Theme',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Switch(
            value: isDark,
            onChanged: (value) async {
              // استخدام toggleDarkMode مباشرة
              await ThemesCubit.get(context).toggleDarkMode();
            },
          ),
        );
      },
    );
  }
}