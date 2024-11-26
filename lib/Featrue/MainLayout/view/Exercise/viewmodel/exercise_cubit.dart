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

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  static ExerciseCubit get(context) => BlocProvider.of(context);
  ExercisesModel? exercisesModel;
  BodyPartsModel? bodyPartsModel;
  LoginModel? loginModel;

  List<int> filter = [
    6,
    6,
    6,
    6,

  ];
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



  String result2 ='';
  void updateTitleByIndex(
      int index, int buttonIndex, List<Map<String, dynamic>> buttons) {
    if (
        buttons[index]['title'] == 'Recovery and Stretching'||
        buttons[index]['title'] == 'Cardio'

    ) {
      print('in function (updateTitleByIndex) title is ${buttons[index]['title']}');
      if (filterDetails[index] == '' || filterDetails[index] == 'false') {
        filterDetails[index] = 'true';
        print('true');
      } else {
        filterDetails[index] = 'false';
        print('false');
      }
    }
    else {

      print(bodyPartsModel!.data[buttonIndex].title);
      print(buttonIndex);
      filterDetails[index] = bodyPartsModel!.data[buttonIndex].id;
    }
  }

  String? bodyPart;
  String? toolOrMachine;
  String? deepAnatomy;

  List exerciseFilter = [];

  Future<void> getExercise({int? page, Map<String, dynamic>? query}) async {
exercisesModel =null;
    emit(GetExerciseLoading());

    try {
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

  Future<void> getBodyParts(int index) async {
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

  void changePage(
      {required NumberPaginatorController controller, required int index}) {
    if (controller.currentPage != index) {
      controller.navigateToPage(index);
    }

    emit(ChangePageState());
  }

  Future<void> generateFilterMap(
  {int? page, NumberPaginatorController? controller }) async {
    Map<String, String> result = {};

    result['page'] = page.toString()??'1';
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
}
