
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
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
       if (response.data['status'] == 'false') {
         print('There is an error in the response');

         // التحقق من وجود البيانات الخاصة بالأخطاء
         if (response.data['data'] != null) {
           final errorData = response.data['data'];

           // تحقق من وجود خطأ في البريد الإلكتروني
           if (errorData.containsKey('email')) {
             String emailError = errorData['email'][0]; // الحصول على الرسالة الأولى من قائمة الأخطاء
             print('Email error: $emailError');
             // يمكنك عرض الرسالة هنا
           }

           // تحقق من وجود خطأ في رقم الهاتف
           if (errorData.containsKey('phone')) {
             String phoneError = errorData['phone'][0]; // الحصول على الرسالة الأولى من قائمة الأخطاء
             print('Phone error: $phoneError');
             // يمكنك عرض الرسالة هنا
           }
         }
       }

       else if (response.data['status'] == null) {
         print('There is an error in the response');
       }
       await CashHelper.insertToCash(key: 'token', value: response.data['token']);
       await CashHelper.insertToCash(key: 'email', value: response.data['data']['email']);
       await CashHelper.insertToCash(key: 'id', value: response.data['data']['_id']);
       await CashHelper.insertToCash(key: 'phone', value: phone);
       await CashHelper.insertBoolToCash(key:'isVerified', value: response.data['data']['isOAuthUser']);
       await CashHelper.insertToCash(key: 'name', value: registerModel!.data.username );

       RegisterCubit.name= await CashHelper.getFromCash(key: 'name');
       RegisterCubit.email = await CashHelper.getFromCash(key: 'email');
       RegisterCubit.id = await CashHelper.getFromCash(key: 'id');
       LoginCubit.token = await CashHelper.getFromCash(key: 'token');
       RegisterCubit.isverified = await CashHelper.getBoolFromCash(key: 'isVerified');

       emit(RegisterSuccessState());

     }
         catch(e){
           if (e is DioException) {
             if (e.response != null && e.response!.statusCode == 422) {
               final errorData = e.response!.data['data'];

               if (errorData.containsKey('email')) {
                 String emailError = errorData['email'][0];
                 print('Email error: $emailError');
                 emit(RegisterErrorState(message: emailError));
               }

               if (errorData.containsKey('phone')) {
                 String phoneError = errorData['phone'][0];
                 print('Phone error: $phoneError');
                 emit(RegisterErrorState(message: phoneError));

               }
             }
           } else {
             print('Error: $e');
           }

          print(e.toString());

         }
}

}
