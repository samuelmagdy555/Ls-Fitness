import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  NutritionCubit() : super(NutritionInitial());

  static NutritionCubit get(context) => BlocProvider.of(context);

  Future<void> getImageNutrition({required File image}) async {


    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path),
    });
    emit(GetImageNutritionLoading());
    try {
      DioHelper.post(end_ponit: EndPoints.nutrition , formData: );
      emit(GetImageNutritionSuccess());
    } catch (e) {
      emit(GetImageNutritionError());
    }
  }
}
