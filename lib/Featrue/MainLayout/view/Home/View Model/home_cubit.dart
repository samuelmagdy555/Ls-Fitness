import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../../Courses Feature/View/Specific Course/View/Specific Course.dart';
import '../Model/mode.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  AdvertiseModel? advertiseModel;

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getAdvertise() async {
    emit(GetAdvertiseLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: EndPoints.advertise,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      advertiseModel = AdvertiseModel.fromJson(response.data);
      emit(GetAdvertiseSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetAdvertiseFailed());
    }
  }

  Future<void> useAdvertiseFunction(
      {required String title,
      required String id,
      required BuildContext context}) async {
    emit(UseAdvertiseFunctionLoading());
    try {
      if (title == 'Course') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpecificCourse(
                      courseId: id, isEnrolled: false,
                    )));
      }
    } catch (e) {}
  }
}
