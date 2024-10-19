import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:im_stepper/main.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Sleep%20Alarms/Model/Sleep%20Model.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/Model/Supplement.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/DetailsExercise.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculator/view_Model/food_calculator_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/MainLayOut.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Settings.dart';
import 'package:lsfitness/try.dart';
import 'package:lsfitness/try2.dart';

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
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Meal Alarms/View Model/alarm_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Sleep Alarms/View Model/sleep_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Supplement Meals/View Model/supplements_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Workout Alarms/View Model/workout_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Creatine Feature/View Model/creatine_cubit.dart';
import 'Featrue/MainLayout/view/Exercise/view/Filter/view/FiltterPage.dart';
import 'Featrue/MainLayout/view/Exercise/view/Filter/viewmodel/category_cubit.dart';
import 'Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'Featrue/MainLayout/view/Home/View/Progress Feature/View Model/progress_cubit.dart';
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

  runApp(const  MyApp(),);
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
    final now = DateTime.now();
    Alarm.ringStream.stream.listen((_) async {
      if (_.id == 7) {
        await CreatineCubit.get(context).getWakeUpTime();
        await CreatineCubit.get(context).getSleepTime();
        if (now.isBefore(CreatineCubit.get(context).sleepTime!) &&
            now.isAfter(CreatineCubit.get(context).wakeUpTime!))
        {
          if ((now.hour >= CreatineCubit.get(context).sleepTime!.hour - 1 && now.hour <= CreatineCubit.get(context).sleepTime!.hour) ) {
            await Alarm.set(
                alarmSettings: AlarmSettings(
                    id: 7,
                    dateTime: DateTime(
                        now.year,
                        now.month,
                        now.day + 1,
                        CreatineCubit.get(context).wakeUpTime!.hour + 1,
                        CreatineCubit.get(context).wakeUpTime!.minute),
                    assetAudioPath: _.assetAudioPath,
                    notificationSettings: _.notificationSettings));
          }
          else {
            final alarmSettings = AlarmSettings(
              id: 7,
              dateTime: DateTime(now.year, now.month, now.day, now.hour + 2),
              assetAudioPath: 'assets/alarm.mp3',
              loopAudio: true,
              vibrate: true,
              volume: 0.8,
              fadeDuration: 3.0,
              warningNotificationOnKill: Platform.isIOS,
              notificationSettings: NotificationSettings(
                body: "Time for Water",
                title: "Alarm",
                stopButton: 'stop',
              ),
            );
            Alarm.set(
              alarmSettings: alarmSettings,
            );
          }
        }
        else {
          await Alarm.set(
              alarmSettings: AlarmSettings(
                  id: 7,
                  dateTime: DateTime(
                      now.year,
                      now.month,
                      now.day+1,
                      CreatineCubit.get(context).wakeUpTime!.hour + 1,
                      CreatineCubit.get(context).wakeUpTime!.minute),
                  assetAudioPath: _.assetAudioPath,
                  notificationSettings: _.notificationSettings));
        }
      }
      else {

        await Alarm.set(
            alarmSettings: AlarmSettings(
                id: _.id,
                dateTime: DateTime(now.year, now.month, now.day + 1,
                    _.dateTime.hour, _.dateTime.minute),
                assetAudioPath: _.assetAudioPath,
                notificationSettings: _.notificationSettings));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
        BlocProvider(create: (context) => ExerciseCubit()),
        BlocProvider(create: (context) => CreatineCubit()),
        BlocProvider(create: (context) => ExerciseCubit()),
        BlocProvider(create: (context)=> GoalsCubit()),
        BlocProvider(create: (context)=> ProgressCubit()),
        BlocProvider(create: (context)=> FoodCalculatorCubit()),
        BlocProvider(create: (context)=> FoodCalculatorDetailsCubit()),
        BlocProvider(create: (context) => AlarmCubit()..initializeMeals()),
        BlocProvider(create: (context) => SupplementsCubit()..initializeSupplements()),
        BlocProvider(create: (context) => WorkoutCubit()..initializeWorkout()),
        BlocProvider(create: (context) => SleepCubit()..initializeSleep()),


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
