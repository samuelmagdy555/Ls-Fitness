import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../../Courses Feature/Model/Buy Course Model/Buy Course Model.dart';
import '../Model/All Trainer Model/All Trainer Model.dart';
import '../Model/Trainer Details/Trainer Details.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  static TrainerCubit get(context) => BlocProvider.of(context);

  TrainerResponse? trainerModel;
  DetailsTrainerProfile? detailsTrainerProfile;
  BuyCourseModel? buyCourseModel;


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

  Future<void> subScribeTrainer(
      {required String id,
      required String planType,
      required String planName,
      String? coupon}) async {
    emit(SubscribeTrainerLoading());
    try {
      Map<String, dynamic> data = {
        'planType': planType,
        'planName': planName,
        'coupon': coupon ?? ''
      };
      final response = await DioHelper.post(
        end_ponit:
            '${EndPoints.buyCourse}/${id}/${EndPoints.subscribeToPlan}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        data: data
      );
      emit(SubscribeTrainerSuccess());
      buyCourseModel = BuyCourseModel.fromJson(response.data);

      if (buyCourseModel?.approvalUrl != null) {
        _startPayment(
            url: buyCourseModel!.approvalUrl);
      }
    } catch (e) {
      print(e.toString());
      emit(SubscribeTrainerError());
    }
  }

  void _startPayment(
      {required String url,
        }) async {
    await launchUrl(Uri.parse(url));
  }

  Future<void> CapturePayment({required String token}) async {
    emit(BuyTrainerPlanLoading());
    try {
      await DioHelper.post(
        end_ponit: '${EndPoints.capturePayment}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        query: {
          'token': token,
        },
      );
      emit(BuyTrainerPlanSuccess());

    } catch (e) {
      emit(BuyTrainerPlanError());
      print(e.toString());
    }
  }

  Future<void> CapturePaymentForLessonScreen(
      {required String token,
        required String Id,
        }) async {
    emit(BuyTrainerPlanLoading());
    try {
      await DioHelper.post(
        end_ponit: '${EndPoints.capturePayment}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        query: {
          'token': token,
        },
      );

      emit(BuyTrainerPlanSuccess());

    } catch (e) {
      emit(BuyTrainerPlanError());
      print(e.toString());
    }
  }
}
