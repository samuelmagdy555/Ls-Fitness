import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/DataBase/remote_database/DioHelper.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/Model/Courses%20Model/Courses%20Model.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/Model/Specific%20Model.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/Buy Course Model/Buy Course Model.dart';
import '../View/My Courses/Model/My Courses Model.dart';
import '../View/Specific Course/Model/SpecificCourseLessonModel.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  static CoursesCubit get(context) => BlocProvider.of(context);

  CoursesCategoriesModel? coursesCategoriesModel;
  MyCourses? myCourses;
  SpecificCourseLessonModel? specificCourseLessonModel;
  SpecificLesson? specificLesson;
  BuyCourseModel? buyCourseModel;

  Future<void> CoursesCategories() async {
    emit(CoursesCategoriesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.CategoryCourses,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      coursesCategoriesModel = CoursesCategoriesModel.fromJson(response.data);
      emit(CoursesCategoriesSuccess());
    } catch (e) {
      emit(CoursesCategoriesError());
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

  Future<void> getSpecificCoursesLesson({required String id}) async {
    specificCourseLessonModel = null;
    emit(GetSpecificCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.specificCourseLesson}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      specificCourseLessonModel =
          SpecificCourseLessonModel.fromJson(response.data);

      print(specificCourseLessonModel!.data![1].video!.publicId);
      print(specificCourseLessonModel!.data![1].video!.thumbnail);
      print(specificCourseLessonModel!.data![1].video!.url);
      emit(GetSpecificCoursesSuccess());
    } catch (e) {
      emit(GetSpecificCoursesFailed());
      print(e.toString());
    }
  }

  Future<void> getSpecificLesson({required String id}) async {
    emit(GetSpecificLessonLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.lesson}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      specificLesson = SpecificLesson.fromJson(response.data);
      emit(GetSpecificLessonSuccess());
    } catch (e) {
      emit(GetSpecificLessonFailed());
      print(e.toString());
    }
  }


  Future<void>buyCourse({required String ID}) async{
    emit(BuyCourseLoading());
    try{
      final response = await DioHelper.post(
          end_ponit: '${EndPoints.buyCourse}/$ID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      buyCourseModel = BuyCourseModel.fromJson(response.data);
      emit(BuyCourseSuccess());
    }catch(e){
      emit(BuyCourseError());
      print(e.toString());
    }

  }
}
