import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/privacyModel.dart';

part 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsInitial());
  static TermsAndConditionsCubit get(context) => BlocProvider.of(context);

  PrivacyModel? privacyModel;

  Future<void> termsandConditions() async{
    emit(TermsAndConditionsLoading());
    try{
      final response = await DioHelper.get(
          end_ponit: EndPoints.TermsAndConditions,
          token:LoginCubit.loginModel?.token ?? LoginCubit.token
      );
      emit(TermsAndConditionsSuccess());
      privacyModel = PrivacyModel.fromJson(response.data);
    }catch(e){
      emit(TermsAndConditionsError());
      print(e.toString());
    }
  }

}
