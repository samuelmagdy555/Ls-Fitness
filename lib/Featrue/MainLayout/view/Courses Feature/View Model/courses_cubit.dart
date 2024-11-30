import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/Model/Courses%20Model/Courses%20Model.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../View/My Courses/Model/My Courses Model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  static CoursesCubit get(context) => BlocProvider.of(context);

  AllCoursesModel? allCoursesModel;
  MyCourses? myCourses;

  Future<void> getAllCourses() async {
    emit(GetAllCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.courses,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      allCoursesModel = AllCoursesModel.fromJson(response.data);
      emit(GetAllCoursesSuccess());

    } catch (e) {
      emit(GetAllCoursesFailed());
      print(e.toString());
    }
  }
  Future<void> getMyCourses() async {
    emit(GetMyCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.myCourses,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      myCourses = MyCourses.fromJson(response.data);
      emit(GetMyCoursesSuccess());

    } catch (e) {
      emit(GetMyCoursesFailed());
      print(e.toString());
    }
  }
}
