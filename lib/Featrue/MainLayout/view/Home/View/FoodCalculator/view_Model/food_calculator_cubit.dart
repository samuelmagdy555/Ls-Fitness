import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';
import '../Model/FoodCalculatorModel.dart';

part 'food_calculator_state.dart';

class FoodCalculatorCubit extends Cubit<FoodCalculatorState> {
  FoodCalculatorCubit() : super(FoodCalculatorInitial());
  static FoodCalculatorCubit get(context) => BlocProvider.of(context);

  FoodCalculatorModel? foodCalculatorModel;

  int currentPage = 1; // الصفحة الحالية
  int numberOfPages = 1; // عدد الصفحات الإجمالي

  // دالة لجلب البيانات
  Future<void> getFoodCalculator({String? mealCategory, required int page}) async {
    emit(FoodCalculatorLoading());

    try {
      // بناء endpoint مع الفلترة بناءً على categoryId والصفحة
      final String endpoint = mealCategory != null && mealCategory.isNotEmpty
          ? '${EndPoints.FoodCalculator}?mealCategory=$mealCategory&page=$page'
          : '${EndPoints.FoodCalculator}?page=$page';

      final response = await DioHelper.get(
        end_ponit: endpoint,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);

      // تحديث الصفحة الحالية وعدد الصفحات
      currentPage = page;
      numberOfPages = foodCalculatorModel?.paginationResult.numberOfPages ?? 1;

      emit(FoodCalculatorSuccess(foodCalculatorModel!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorError());
    }
  }

  // دالة للبحث عن البيانات
  Future<void> searchFoodCalculator({required String query}) async {
    emit(FoodCalculatorLoading());

    try {
      final String endpoint = '${EndPoints.FoodCalculator}?keyword=$query';

      final response = await DioHelper.get(
        end_ponit: endpoint,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);
      emit(FoodCalculatorSuccess(foodCalculatorModel!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorError());
    }
  }
}
