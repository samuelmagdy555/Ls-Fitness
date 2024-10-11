import 'dart:isolate';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/try.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/NewPassword_cubit/new_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/OTPScree_Cubit/otp_cubit.dart';
import 'Featrue/Auth Feature/Register/view_model/regester_cubit.dart';
import 'Featrue/Auth Feature/login/view_mode/login_cubit.dart';
import 'Featrue/Intro Feature/Splash/View/Splash_Screen.dart';
import 'Featrue/Intro Feature/onboarding/View/Widget/colors.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View Model/Alarm Provider/Alarm Provider.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import 'Featrue/MainLayout/view/Exercise/view/Filter/view/FiltterPage.dart';
import 'Featrue/MainLayout/view/Exercise/view/Filter/viewmodel/category_cubit.dart';
import 'Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'Featrue/MainLayout/view/Profile/ChangePassword/view_model/change_password_cubit.dart';
import 'Featrue/MainLayout/view/Profile/EditProfile/View_Model/edit_profile_cubit.dart';
import 'Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:provider/provider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  await DioHelper.init();
  await CashHelper.init();

  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();

  runApp(ChangeNotifierProvider(
    create: (context) => alarmprovider()..initializeMeals(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Alarm.ringStream.stream.listen((_) async {
      print('Alarm is ringing');
      final now = DateTime.now();

      await Alarm.set( alarmSettings: AlarmSettings(id: _.id, dateTime: DateTime(now.year , now.month, now.day+1, _.dateTime.hour, _.dateTime.minute) , assetAudioPath: _.assetAudioPath, notificationSettings: _.notificationSettings));

    });  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(create: (context) => NewPasswordCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(
          create: (context) => CategoryCubit()
            ..getCategory()
            ..getBodyParts(),
          child: FilterPage(),
        ),
        BlocProvider(create: (context) => ExerciseCubit())
      ],
      child: GetMaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: kThirdColor),
        debugShowCheckedModeBanner: false,
        home: TimerScreen(),
      ),
    );
  }
}
