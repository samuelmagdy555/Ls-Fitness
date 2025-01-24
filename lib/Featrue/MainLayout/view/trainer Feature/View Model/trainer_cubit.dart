import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/All Trainer Model/All Trainer Model.dart';
import '../Model/Trainer Details/Trainer Details.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  static TrainerCubit get(context) => BlocProvider.of(context);

  TrainerResponse? trainerModel;
  DetailsTrainerProfile? detailsTrainerProfile;

  Future<void> getTrainersData() async {
    emit(GetTrainerDataLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.trainerProfiles,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      trainerModel = TrainerResponse.fromJson(response.data);

      emit(GetTrainerDataSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetTrainerDataError());
    }
  }

  Future<void> getDetailsTrainerData({required String id}) async {
    emit(GetDetailsTrainerDataLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.trainerProfiles}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      detailsTrainerProfile = DetailsTrainerProfile.fromJson(response.data);

      emit(GetDetailsTrainerDataSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetDetailsTrainerDataError());
    }
  }
}
