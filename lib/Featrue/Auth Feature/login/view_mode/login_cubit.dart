import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/exercise.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:meta/meta.dart';

import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static String token = '';
  static String id = '';
  static String name = '';
  static String email = '';
  static bool isVerified = false;

  static LoginCubit get(context) => BlocProvider.of(context);
  static LoginModel? loginModel;

  Future<void> userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.PostData(
          end_point: EndPoints.Login,
          data: {
            'email': 'sos@gmail.com',
            'password': 'qwerqwer'
          });
      loginModel = LoginModel.fromJson(response.data);
      print('token from model${loginModel!.token}');
      await CashHelper.insertToCash(
          key: 'token', value: response.data['token']);
      await CashHelper.insertToCash(
          key: 'email', value: response.data['data']['email']);
      await CashHelper.insertToCash(
          key: 'id', value: response.data['data']['_id']);
      await CashHelper.insertBoolToCash(
          key: 'isVerfied', value: response.data['data']['isOAuthUser']);
      await CashHelper.insertToCash(
          key: 'name', value: response.data['data']['username']);

      LoginCubit.email = await CashHelper.getFromCash(key: 'email');
      LoginCubit.id = await CashHelper.getFromCash(key: 'id');
      LoginCubit.name = await CashHelper.getFromCash(key: 'name');
      LoginCubit.token = await CashHelper.getFromCash(key: 'token');
      LoginCubit.isVerified =
          await CashHelper.getBoolFromCash(key: 'isVerfied');
      print(token);
      emit(LoginSuccessState());
      ExerciseCubit.get(context).getExercise(page: 1);
    } catch (error) {
      print(error.toString());
      emit(LoginErrorState(message: error.toString()));
    }
  }
}
