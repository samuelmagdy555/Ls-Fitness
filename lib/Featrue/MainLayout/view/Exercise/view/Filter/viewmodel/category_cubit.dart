import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../model/BodyPartsModel.dart';
import '../model/CategoryModel.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);
  CategoryModel? categoryModel;
  BodyPartsModel? bodyPartsModel;
  LoginModel? loginModel;


  Future<void> getCategory()async{
    emit(getCategoryLoading());
    try{
      final response = await DioHelper.get(end_ponit: EndPoints.Categories,
          token: loginModel?.token ?? LoginCubit.token

      );
      categoryModel = CategoryModel.fromJson(response.data);
      emit(getCategorySuccess());
    }
    catch(e){
      print(e.toString());
      emit(getCategoryError());
    }
  }


  Future<void> getBodyParts()async{
    emit(getBodyPartsLoading());
    try{
      final response = await DioHelper.get(
          end_ponit: EndPoints.BodyPart,
          token: loginModel?.token ?? LoginCubit.token
      );
      bodyPartsModel = BodyPartsModel.fromJson(response.data);
      emit(getBodyPartsSuccess());
    }
    catch(e){
      print(e.toString());
      emit(getBodyPartsError());
    }
  }
}
