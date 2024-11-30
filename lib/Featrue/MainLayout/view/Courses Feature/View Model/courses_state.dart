part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}


final class GetAllCoursesLoading extends CoursesState {}
final class GetAllCoursesSuccess extends CoursesState {}
final class GetAllCoursesFailed extends CoursesState {}

final class GetMyCoursesLoading extends CoursesState {}
final class GetMyCoursesSuccess extends CoursesState {}
final class GetMyCoursesFailed extends CoursesState {}
