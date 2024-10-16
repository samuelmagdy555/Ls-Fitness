
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../model/ProfileModel.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static String name = '';

  static ProfileCubit get(context) =>BlocProvider.of(context);
  ProfileModel? profileModel;




  Future<void> myProfile() async {
    emit(getProfileLoading());
    try{
      final response = await DioHelper.get(
          end_ponit:EndPoints.Profile,
        token:LoginCubit.loginModel?.token ?? LoginCubit.token
      );
      profileModel = ProfileModel.fromJson(response.data);
      emit(getProfileSuccess());
    }
    catch (e){
      print(e.toString());
      emit(getProfileError(message: e.toString()));
    }
  }



}
