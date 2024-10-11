import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../model/ExerciseModel.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  static ExerciseCubit get(context) => BlocProvider.of(context);
  ExerciseModel? exerciseModel;
  LoginModel? loginModel;


  Future<void> getExercise()async{
    emit(GetExerciseLoading());
    try{
      final response = await DioHelper.get(end_ponit: EndPoints.GetExercise,
        token: loginModel?.token ?? LoginCubit.token);
      print(response.data);
      exerciseModel = ExerciseModel.fromJson(response.data);
      emit(GetExerciseSuccess());
    }
        catch(e){
      print(e.toString());
      emit(GetExerciseError());
        }
  }
}
