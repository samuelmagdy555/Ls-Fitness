

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../Model/Goals_Model.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsInitial());

  static GoalsCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  GoalsModel? goalsModel;

  String selectedGender = 'male';
  int selectedAge = 20;
  int? selectedLength;
  String? selectedLengthUnit;
  int? selectedWeight;
  String? selectedWeightUnit = 'kg';
  String? selectedTargetWeightUnit ='Kg';
  String? selectAddress;
  String? selectNationality;
  String? walkDaily;
  String? workRoutine;
  String? fitnessLevel ;
  String? mainGoal ;
  String? allergicSubstances;
  String? injuries;
  String? exercisePreference;
  String? Diets;
  String? TargetWeight;
  String? FitnessEquipment ;
  String? TrainingTime ;
  String? HearUs;
  String? LocationOfTraining;
  String? ExperienceIssues;
  String? TrainingBreak;
  int? selectedTargetweight;

  Future<void> MyGoals({
    required String weight,
    required String Targetweight,
    required int age,
    required String length,
    required String gender,
    required String address,
    required String nationality,
    required String walkDaily,
    required String workRoutine,
    required String fitnessLevel ,
    required String mainGoal ,
    required String allergicSubstances,
    required String injuries,
    required String exercisePreference,
    required String Diets,
    required String TargetWeight,
    required String FitnessEquipment,
    required String TrainingTime ,
    required String HearUs,
    required String LocationOfTraining,
    required String ExperienceIssues,
    required String TrainingBreak,

  }) async {
    emit(MyGoalsLoading());

    print(selectedLength);
    print(selectedLengthUnit);
    print(selectedWeight);
    print(selectedWeightUnit);
    print(selectedTargetweight);
    print(selectedGender);

    print("Token being used: ${loginModel?.token ?? LoginCubit.token}");

    try {
      final response = await DioHelper.PostData(
        // end_ponit: EndPoints.MyGoals,
        end_point: EndPoints.MyGoals,
        token: loginModel?.token ?? LoginCubit.token,
        data: {
          'gender': selectedGender,
          'age': selectedAge.toString(),
          'height': '$selectedLength $selectedLengthUnit',
          'weight': '$selectedWeight $selectedWeightUnit',
          'targetWeight': '$selectedTargetweight $selectedTargetWeightUnit',
          'address': selectAddress,

        },
      );
      emit(MyGoalsSuccess());
       goalsModel = GoalsModel.fromJson(response.data);
    } catch (e) {
      emit(MyGoalsError());
      print(e.toString());
    }
  }

  void setLength(int length, String unit) {
    selectedLength = length;
    selectedLengthUnit = unit;
  }

  void setGender(String gender) {
    selectedGender = gender;
  }

  void setAge(int Age) {
    selectedAge = Age;
  }

  void setWeigth(int weight, {bool? isKg}) {
    if (isKg != null && isKg) {
      selectedWeight = weight;
    } else {
      selectedWeight = weight;
    }
  }


  void setTargetWeigth(int Targetweigth,{bool? isKg}) {
    // selectedTargetweight = Targetweigth;
    if (isKg != null && isKg){
      selectedTargetweight = Targetweigth;
    } else {
      selectedTargetweight = Targetweigth;
    }

  }
}
