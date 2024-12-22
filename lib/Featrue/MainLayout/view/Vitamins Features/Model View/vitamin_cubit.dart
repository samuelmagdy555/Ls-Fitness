import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
 static VitaminScreenCubit get(context) => BlocProvider.of(context);

  Future<void> getAllVitamins() async {
    emit(GetVitaminLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.vitamins,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      vitaminsModel = VitaminsModel.fromJson(response.data);
      emit(GetVitaminSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetVitaminError());
    }
  }
  Future<void> getAllSupplements() async {
    emit(GetSupplementsLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.vitamins,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      supplementModel = SupplementModel.fromJson(response.data);
      emit(GetSupplementsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSupplementsError());
    }
  }
}
