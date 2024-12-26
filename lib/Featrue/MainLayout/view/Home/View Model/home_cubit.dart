import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/mode.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  AdvertiseModel? advertiseModel;

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getAdvertise() async {
    emit(GetAdvertiseLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: EndPoints.advertise,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      advertiseModel = AdvertiseModel.fromJson(response.data);
      emit(GetAdvertiseSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetAdvertiseFailed());
    }
  }
}
