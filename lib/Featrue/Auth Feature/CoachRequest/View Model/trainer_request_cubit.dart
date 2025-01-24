import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:meta/meta.dart';
import 'package:mime/mime.dart';
import 'dart:io';
import 'package:mime/mime.dart'; // Import the mime package
import 'package:dio/dio.dart';
import '../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../login/view_mode/login_cubit.dart';
import '../View/request Done.dart';
import '../View/request Not Done.dart';

part 'trainer_request_state.dart';

class TrainerRequestCubit extends Cubit<TrainerRequestState> {
  TrainerRequestCubit() : super(TrainerRequestInitial());

  static TrainerRequestCubit get(context) => BlocProvider.of(context);

  String trainerName = '';
  String trainerEmail = '';
  String trainerPhone = '';
  String trainerNationality = '';
  String trainerExperience = '';
  String trainerAge = '';
  String trainerAbout = '';
  String trainerCurrentLocation = '';
  String trainerNumberOfTrainees = '';

  Future<void> requestToBeTrainer(
      List<File> certificates,
      BuildContext context,
      String trainerName,
      String trainerEmail,
      String trainerPhone,
      String trainerNationality,
      String trainerExperience,
      String trainerAge,
      String trainerAbout,
      String trainerCurrentLocation,
      String trainerNumberOfTrainees) async {
    emit(requestToBeTrainerLoading());
    try {
      // Prepare FormData for multipart upload
      Map<String, dynamic> data = {
        'name': trainerName,
        'email': trainerEmail,
        'phone': trainerPhone,
        'nationality': trainerNationality,
        'yearsOfExperience': trainerExperience,
        'age': trainerAge,
        'introduceYourSelf': trainerAbout,
        'location': trainerCurrentLocation,
        'numberOfTrainees': trainerNumberOfTrainees,
        'certificates': certificates.map((file) => file.path).toList(),
      };

      final response = await DioHelper.post(
        end_ponit: EndPoints.trainerRequests,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        data: data,
      );

      if (response.statusCode == 201) {
        print(response.data);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerRequestSuccessScreen(),
            ),
            (_) => false);
        emit(requestToBeTrainerSuccess());
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerRequestAlreadySubmittedScreen(),
            ),
                (_) => false);
        print("Error: ${response.statusCode}, ${response.data}");
        emit(requestToBeTrainerError());
      }
    } catch (e) {
      // طباعة الخطأ مع رسالة واضحة
      print("An error occurred: $e");
      emit(requestToBeTrainerError());
    }
  }
}
