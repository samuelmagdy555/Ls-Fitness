import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Model/Specific%20Vitmain/Specific%20Vitmain.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Vitamins%20Features/Model/Speicific%20Supplement/Speicific%20Supplement.dart';
import 'package:meta/meta.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/Supplement Model/Supplement model.dart';
import '../Model/Vitamins model/Viamins model.dart';

part 'vitamin_state.dart';

class VitaminScreenCubit extends Cubit<VitaminScreenState> {
  VitaminScreenCubit() : super(VitaminInitial());
  VitaminsModel? vitaminsModel;
  SupplementModel? supplementModel;
  SpecificSupplement? specificSupplement;
  SpecificVitamin?  specificVitamin;
 static VitaminScreenCubit get(context) => BlocProvider.of(context);

  Future<void> getAllVitamins({required String page}) async {
    emit(GetVitaminLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.vitamins,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          query: {
            'page': page,
          }
      );
      vitaminsModel = VitaminsModel.fromJson(response.data);
      emit(GetVitaminSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetVitaminError());
    }
  }


  void changeVitaminsPage(
      {required NumberPaginatorController controller, required int index}) {
    if (controller.currentPage != index) {
      controller.navigateToPage(index);
    }
    getAllVitamins(page: (index + 1).toString());
    emit(ChangePageState());
  }
  void changeSupplementsPage(
      {required NumberPaginatorController controller, required int index}) {
    if (controller.currentPage != index) {
      controller.navigateToPage(index);
    }
    getAllSupplements(page: (index + 1).toString());
    emit(ChangePageState());
  }
  Future<void> getAllSupplements({required String page}) async {
    emit(GetSupplementsLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.supplements,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,query: {
        'page': page,
      });
      supplementModel = SupplementModel.fromJson(response.data);
      emit(GetSupplementsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSupplementsError());
    }
  }

  Future<void> getSpecificVitamin({required String id}) async {
    emit(GetSupplementsLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.vitamins}/$id',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      specificVitamin = SpecificVitamin.fromJson(response.data);
      emit(GetSupplementsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSupplementsError());
    }
  }
  Future<void> getSpecificSupplements({required String id}) async {
    emit(GetSupplementsLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.supplements}/$id',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      specificSupplement = SpecificSupplement.fromJson(response.data);
      emit(GetSupplementsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSupplementsError());
    }
  }
}
