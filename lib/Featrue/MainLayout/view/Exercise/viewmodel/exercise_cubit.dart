import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/BodyParts/Model/BodyPartsModel.dart';
import 'package:meta/meta.dart';
import 'package:number_paginator/number_paginator.dart';

import '../model/ExerciseModel.dart';
import '../model/Specific deep anatomy/Specific deep anatomy.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  static ExerciseCubit get(context) => BlocProvider.of(context);
  ExercisesModel? exercisesModel;
  BodyPartsModel? bodyPartsModel;
  LoginModel? loginModel;
  SpecificDeepAnatomy? specificDeepAnatomy;

  int currentPage = 1;

  // void changePage({required controller, required int index}) {
  //   currentPage = index + 1;
  //   emit(PageChangedState());
  // }

  void changePage(
      {required NumberPaginatorController controller, required int index}) {
    if (controller.currentPage != index) {
      controller.navigateToPage(index);
    }
    emit(ChangePageState());
  }

  List<int> filter = [
    6,
    6,
    6,
    6,

  ];

  // بنخزن فيها اسم الزرار سواء كان cardio ولا tool
  List<String> filterDetails = [
    '',
    '',
    '',
    '',
  ];
  List<String> buttons = [
    'toolOrMachine',
    'Cardio',
    'recoveryAndStretching',
    'deepAnatomy'
  ];

  String result2 = '';

  void updateTitleByIndex(
      int index, int buttonIndex, List<Map<String, dynamic>> buttons) {

    if (buttons[index]['title'] == 'Recovery and Stretching' ||
        buttons[index]['title'] == 'Cardio') {

      if (filterDetails[index] == '' || filterDetails[index] == 'false') {
        filterDetails[index] = 'true';
        print('true');
      } else {
        filterDetails[index] = 'false';
        print('false');
      }
    } else {
      print('elseeeeeeeee');

      if (buttons[index]['title'] == 'Deep Anatomy') {
        filterDetails[index] = specificDeepAnatomy!.data[buttonIndex].id;
      } else {
        filterDetails[index] = bodyPartsModel!.data[buttonIndex].id;
      }
    }
  }

  String? bodyPart;
  String? toolOrMachine;
  String? deepAnatomy;

  List exerciseFilter = [];

  Future<void> getExercise({int? page, Map<String, dynamic>? query , }) async {
    emit(GetExerciseLoading());
    try {
      print('getExercise');
      final response = await DioHelper.get(
          end_ponit: EndPoints.GetExercise,
          token: loginModel?.token ?? LoginCubit.token,
          query: page != null
              ? {
                  'page': page,
                }
              : query);
      print(response.data);
      exercisesModel = ExercisesModel.fromJson(response.data);
      emit(GetExerciseSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetExerciseError());
    }
  }

  Future<void> getDeepAnatomyOrTool(int index) async {
    bodyPartsModel = null;
    emit(BodyPartsLoading());
    try {
      print(index);
      final response = await DioHelper.get(
          end_ponit:
              index == 0 ? EndPoints.toolOrMachine : EndPoints.deepAnatomy,
          token: loginModel?.token ?? LoginCubit.token);
      print(response.data);
      bodyPartsModel = BodyPartsModel.fromJson(response.data);
      emit(BodyPartsSuccess());
    } catch (e) {
      print(e.toString());
      emit(BodyPartsError());
    }
  }

//hel

  Future<void> getBodyParts() async {
    bodyPartsModel = null;
    emit(BodyPartsLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.BodyPart,
          token: loginModel?.token ?? LoginCubit.token);
      print(response.data);
      bodyPartsModel = BodyPartsModel.fromJson(response.data);
      emit(BodyPartsSuccess());
    } catch (e) {
      print(e.toString());
      emit(BodyPartsError());
    }
  }

  Future<void> getDeepAnatomyForSpecificBodyPart({required String id}) async {
    emit(GetDeepAnatomyForBodyPartsSuccess());
    try {
      final response = await DioHelper.get(
        end_ponit: '${EndPoints.BodyPart}/$id/${EndPoints.deepAnatomies}',
        token: loginModel?.token ?? LoginCubit.token,
      );

      specificDeepAnatomy = SpecificDeepAnatomy.fromJson(response.data);
      emit(GetDeepAnatomyForBodyPartsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetDeepAnatomyForBodyPartsError());
    }
  }

  Future<void> generateFilterMap(
      {int? page, NumberPaginatorController? controller}) async {
    Map<String, String> result = {};

    result['page'] = page.toString() ?? '1';
    print(result2);
    result['bodyPart'] = result2;

    for (int i = 0; i < filter.length; i++) {
      if (filter[i] != 6) {
        result[buttons[i]] = filterDetails[i];
        print('==============>');
        print(filterDetails[i]);
      }
    }

    getExercise(query: result);
  }

  List<String> LoadItems(int index) {
    List<String> items = [];

    for (var item in bodyPartsModel!.data) {
      items.add(item.title);
    }
    return items;
  }

  List<String> LoadDeepAnatomyItems(int index) {
    List<String> items = [];

    for (var item in specificDeepAnatomy!.data) {
      items.add(item.title);
    }
    return items;
  }

  List<String> LoadBodyPartItems(int index) {
    List<String> items = [];

    for (var item in bodyPartsModel!.data) {
      items.add(item.title);
    }
    return items;
  }

  Future<void> workoutWithBodyPart({required String BodyPartId , required int index }) async {
    emit(WorkoutWithBodyPartLoading());
    try {

      final response = await DioHelper.get(
          end_ponit: '${EndPoints.GetExercise}',
          token: loginModel?.token ?? LoginCubit.token,
          query: {'Warmup': true, 'bodyPart':  bodyPartsModel!.data[index].id});

      exercisesModel = ExercisesModel.fromJson(response.data);
      emit(WorkoutWithBodyPartSuccess());
    } catch (e) {
      print(e.toString());
      emit(WorkoutWithBodyPartError());
    }
  }
}
