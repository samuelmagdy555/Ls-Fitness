import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../Model/FoodCalculatorModel.dart';

part 'food_calculator_state.dart';

class FoodCalculatorCubit extends Cubit<FoodCalculatorState> {
  FoodCalculatorCubit() : super(FoodCalculatorInitial());
  static FoodCalculatorCubit get(context) => BlocProvider.of(context);

  FoodCalculatorModel? foodCalculatorModel;

    Future<void> getFoodCalculator() async{
      emit(FoodCalculatorLoading());
      try{
        final response = await DioHelper.get(
            end_ponit: EndPoints.FoodCalculator);
        foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);
        emit(FoodCalculatorSuccess(foodCalculatorModel!));
      } catch(e){
        print(e.toString());
        emit(FoodCalculatorError());
      }
    }
}
