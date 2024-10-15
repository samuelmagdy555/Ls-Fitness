
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
  String selectedGender = 'male';
  String selectedAge = '0';
  int? selectedLength;
  double? selectedWeight;
  double? selectedTargetweight;


  Future<void> MyGoals({
    required String weight,
    required String Targetweight,
    required int age,
    required String length,
    required String gender,}) async {
    emit(MyGoalsLoading());

    print(selectedLength);
    print(selectedWeight);
    print(selectedTargetweight);
    print(selectedGender);
    try {


      final response = await DioHelper.PostData(
          // end_ponit: EndPoints.MyGoals,
          end_point: EndPoints.MyGoals,
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
  void setAge(String Age) {
    selectedAge = Age;
  }
  void setLength(int length) {
    selectedLength = length;
  }

  void setWeigth(double weigth){
    selectedWeight = weigth;
  }
  void setTargetWeigth( double Targetweigth){
    selectedTargetweight = Targetweigth;
  }








}