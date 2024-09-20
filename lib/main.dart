import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Featrue/ForgetPassword/View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import 'package:lsfitness/Featrue/ForgetPassword/View_model/NewPassword_cubit/new_password_cubit.dart';
import 'package:lsfitness/Featrue/ForgetPassword/View_model/OTPScree_Cubit/otp_cubit.dart';
import 'package:lsfitness/Featrue/Register/view_model/regester_cubit.dart';
import 'package:lsfitness/Featrue/login/view_mode/login_cubit.dart';

import 'Featrue/Splash/View/Splash_Screen.dart';

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
        BlocProvider(create: (context)=> NewPasswordCubit())
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


