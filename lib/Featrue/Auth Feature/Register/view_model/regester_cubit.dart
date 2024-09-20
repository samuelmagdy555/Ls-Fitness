
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../model/Register_model.dart';

part 'regester_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static String token =''  ;
  static String id ='';
  static String name = '';
  static String phone = '' ;
  static String email = '' ;
  static bool isverified= false;
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  Future<void> userRegister({
    required  String username,
    required  String email,
    required  String phone,
    required  String password,
    required  String confirmPassword,
}) async{
     emit(RegisterLoadingState());
     try{
       final response = await DioHelper.PostData(
           // end_ponit: EndPoints.Register,
         end_point: EndPoints.Register,
         data: {
             'username' : username,
             'email' : email,
             'phone' : phone,
             'password' : password,
             'confirmPassword' : confirmPassword

         }
       );

       registerModel = RegisterModel.fromJson(response.data);
       print(response.data);
       await CashHelper.insertToCash(key: 'token', value: response.data['token']);
       await CashHelper.insertToCash(key: 'email', value: response.data['data']['email']);
       await CashHelper.insertToCash(key: 'id', value: response.data['data']['_id']);
       await CashHelper.insertToCash(key: 'phone', value: phone);
       await CashHelper.insertBoolToCash(key:'isVerified', value: response.data['data']['isOAuthUser']);
       await CashHelper.insertToCash(key: 'name', value: registerModel!.data.username );

       RegisterCubit.name= await CashHelper.getFromCash(key: 'name');
       RegisterCubit.email = await CashHelper.getFromCash(key: 'email');
       RegisterCubit.id = await CashHelper.getFromCash(key: 'id');
       RegisterCubit.token = await CashHelper.getFromCash(key: 'token');
       RegisterCubit.isverified = await CashHelper.getBoolFromCash(key: 'isVerified');

       emit(RegisterSuccessState());

     }
         catch(error){
          print(error.toString());
          emit(RegisterErrorState());

         }
}

}
