
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Profile/model/ProfileModel.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static String name = '';
  String token = '';

  static ProfileCubit get(context) =>BlocProvider.of(context);
  LoginModel? loginModel;
  ProfileModel? profileModel;




  Future<void> myProfile() async {
    emit(getProfileLoading());
    try{
      final response = await DioHelper.get(
          end_ponit:EndPoints.Profile,
        token: loginModel?.token ?? token
      );
      print(response.data);
      profileModel = ProfileModel.fromJson(response.data);
      emit(getProfileSuccess());
    }
    catch (e){
      print(e.toString());
      emit(getProfileError(message: e.toString()));
    }
  }



}
