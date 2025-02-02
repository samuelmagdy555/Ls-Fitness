import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/privacyModel.dart';

part 'privacy_and_terms_state.dart';

class PrivacyAndTermsCubit extends Cubit<PrivacyAndTermsState> {
  PrivacyAndTermsCubit() : super(PrivacyAndTermsInitial());


  static PrivacyAndTermsCubit get(context) => BlocProvider.of(context);

  PrivacyModel? privacyModel ;

  Future<void> termsandprivacy() async{
    emit(PrivacyAndTermsLoading());
    try{
      final response = await DioHelper.get(
        end_ponit: EndPoints.termsandprivacy,
          token:LoginCubit.loginModel?.token ?? LoginCubit.token
      );

      privacyModel = PrivacyModel.fromJson(response.data);
      emit(PrivacyAndTermsSuccess());
    }catch(e){
      emit(PrivacyAndTermsError());
      print(e.toString());
    }
  }
}
