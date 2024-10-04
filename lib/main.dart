import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Featrue/ChangePassword/view_model/change_password_cubit.dart';
import 'package:lsfitness/Featrue/DetailsExercise/view/DetailsExercise.dart';
import 'package:lsfitness/Featrue/EditProfile/View_Model/edit_profile_cubit.dart';
import 'package:lsfitness/Featrue/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/Filter/view/FiltterPage.dart';
import 'package:lsfitness/Featrue/Filter/viewmodel/category_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/MainLayOut.dart';
import 'package:lsfitness/Featrue/Profile/view_model/profile_cubit.dart';


import 'Featrue/Auth Feature/ForgetPassword/View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/NewPassword_cubit/new_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/OTPScree_Cubit/otp_cubit.dart';
import 'Featrue/Auth Feature/Register/view_model/regester_cubit.dart';
import 'Featrue/Auth Feature/login/view_mode/login_cubit.dart';
import 'Featrue/Intro Feature/Splash/View/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(create: (context)=> NewPasswordCubit()),
        BlocProvider(create: (context)=> ProfileCubit()),
        BlocProvider(create: (context)=> ChangePasswordCubit()),
        BlocProvider(create: (context)=> EditProfileCubit()),
        BlocProvider(create: (context)=> CategoryCubit()..getCategory()..getBodyParts(),child:FilterPage (),),
        BlocProvider(create: (context)=> ExerciseCubit())


      ],

      child: GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen() ,
      ),
    );
  }
}


