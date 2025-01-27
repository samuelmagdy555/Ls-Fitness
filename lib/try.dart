// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // Cubit لإدارة الثيم
// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(lightMaleTheme); // الثيم الافتراضي
//
//   void toggleTheme(bool isDark, String gender) {
//     if (isDark) {
//       emit(gender == 'male' ? darkMaleTheme : darkFemaleTheme);
//     } else {
//       emit(gender == 'male' ? lightMaleTheme : lightFemaleTheme);
//     }
//   }
// }
//
// // الثيمات الأربعة مع تغييرات واضحة
// final ThemeData lightMaleTheme = ThemeData(
//   brightness: Brightness.light,
//   primaryColor: Colors.blue,
//   scaffoldBackgroundColor: Colors.lightBlue[50],
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
//     titleLarge: TextStyle(color: Colors.blueAccent, fontSize: 20),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.blue,
//       foregroundColor: Colors.white,
//     ),
//   ),
// );
//
// final ThemeData lightFemaleTheme = ThemeData(
//   brightness: Brightness.light,
//   primaryColor: Colors.pink,
//   scaffoldBackgroundColor: Colors.pink[50],
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.bold),
//     titleLarge: TextStyle(color: Colors.pinkAccent, fontSize: 20),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.pink,
//       foregroundColor: Colors.white,
//     ),
//   ),
// );
//
// final ThemeData darkMaleTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.blueGrey,
//   scaffoldBackgroundColor: Colors.black,
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
//     titleLarge: TextStyle(color: Colors.blueAccent, fontSize: 20),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.blueGrey,
//       foregroundColor: Colors.white,
//     ),
//   ),
// );
//
// final ThemeData darkFemaleTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.purple,
//   scaffoldBackgroundColor: Colors.grey[900],
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: Colors.purple, fontSize: 18, fontWeight: FontWeight.bold),
//     titleLarge: TextStyle(color: Colors.purpleAccent, fontSize: 20),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.purple,
//       foregroundColor: Colors.white,
//     ),
//   ),
// );
//
// // Main Function
// void main() {
//   runApp(BlocProvider(
//     create: (context) => ThemeCubit(),
//     child: MyApp(),
//   ));
// }
//
// // واجهة التطبيق
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeData>(
//       builder: (context, theme) {
//         return MaterialApp(
//           theme: theme,
//           home: ThemeSwitcherPage(),
//         );
//       },
//     );
//   }
// }
//
// // الصفحة الرئيسية
// class ThemeSwitcherPage extends StatefulWidget {
//   @override
//   _ThemeSwitcherPageState createState() => _ThemeSwitcherPageState();
// }
//
// class _ThemeSwitcherPageState extends State<ThemeSwitcherPage> {
//   bool isDark = false; // الوضع الافتراضي
//   String gender = 'male'; // الجنس الافتراضي
//
//   @override
//   Widget build(BuildContext context) {
//     final themeCubit = BlocProvider.of<ThemeCubit>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تبديل الثيمات'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // اختيار الجنس
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('الجنس: ', style: Theme.of(context).textTheme.bodyLarge),
//                 DropdownButton<String>(
//                   value: gender,
//                   items: [
//                     DropdownMenuItem(value: 'male', child: Text('رجال')),
//                     DropdownMenuItem(value: 'female', child: Text('ستات')),
//                   ],
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                       themeCubit.toggleTheme(isDark, gender);
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//
//             // تبديل الثيم (Light/Dark)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('الوضع الداكن', style: Theme.of(context).textTheme.bodyLarge),
//                 Switch(
//                   value: isDark,
//                   onChanged: (value) {
//                     setState(() {
//                       isDark = value;
//                       themeCubit.toggleTheme(isDark, gender);
//                     });
//                   },
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 40),
//
//             // زر تجريبي يعكس تأثير الثيم
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('زر تجريبي'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
