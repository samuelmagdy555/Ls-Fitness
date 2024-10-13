import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsInitial());

  static GoalsCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  String? selectedGender;
  int? selectedAge;
  String? selectedLength;
  String? selectedWeight;
  String? selectedTargetweight;


  Future<void> MyGoals({
    required String weight,
    required String Targetweight,
    required String age,
    required String length,
    required String gender,}) async {
    emit(MyGoalsLoading());
    try {
      final response = await DioHelper.post(
        end_ponit: EndPoints.MyGoals,
          // end_point: EndPoints.MyGoals,
          token: loginModel?.token ?? LoginCubit.token,
          data: {
            'gender': selectedGender,
            'age': selectedAge,
            'length': selectedLength,
            'weight': selectedWeight,
            'targetWeight': selectedTargetweight,});
      emit(MyGoalsSuccess());
    }
    catch (e) {
      emit(MyGoalsError());
      print(e.toString());
    }
  }
  void setGender(String gender) {
    selectedGender = gender;
  }
  void setAge(int Age) {
    selectedAge = Age;
  }
  void setLength(String length) {
    selectedLength = length;
  }

  void setWeigth(String weigth){
    selectedWeight = weigth;
  }
  void setTargetWeigth(String Targetweigth){
    selectedTargetweight = Targetweigth;
  }








}



