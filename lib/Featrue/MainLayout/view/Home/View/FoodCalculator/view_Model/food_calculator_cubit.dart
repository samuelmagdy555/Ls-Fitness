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

  // تعديل دالة getFoodCalculator لاستقبال categoryId
  Future<void> getFoodCalculator({String? mealCategory}) async {
    emit(FoodCalculatorLoading());

    try {
      // بناء الـ API endpoint بناءً على categoryId
      final String endpoint = mealCategory != null && mealCategory.isNotEmpty
          ? '${EndPoints.FoodCalculator}?mealCategory=$mealCategory'
          : EndPoints.FoodCalculator;

      final response = await DioHelper.get(end_ponit: endpoint);
      foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);
      emit(FoodCalculatorSuccess(foodCalculatorModel!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorError());
    }
  }
}
