import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  Future<void> EditProfile({
    required String username,
    required String phone,
    required String email})async{
    emit(EditProfileLoading());
    try{
      final response = await DioHelper.putEditProfile(
          end_ponit: EndPoints.EditProfile,
          token: loginModel?.token ?? LoginCubit.token,
          data: {
            'username': username,
            'phone' : phone,
            'email' : email}

      );
      emit(EditProfileSuccess());
    }
    catch(e){
      emit(EditProfileError());
      print(e.toString());
    }
  }


  Future<void> changeImage({
    required File image,
    required String username,
    required String phone,
    required String email}) async {
    emit(ChangeImageLoading());
    try{
      FormData formData = FormData.fromMap({
        "_method" : "put",
        'username': username,
        'phone' : phone,
        'email' : email,
        'profileImg' : await MultipartFile.fromFile(image.path),
      });
      final response = await DioHelper.putImage(
        end_ponit: EndPoints.EditProfile,
        token: loginModel?.token ?? LoginCubit.token,
        formData: formData,
      );
      emit(ChangeImageSuccess());
    }
    catch(e){
      print(e.toString());
      emit(ChangeImageError());
    }
  }






}