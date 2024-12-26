import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'more_courses_state.dart';

class MoreCoursesCubit extends Cubit<MoreCoursesState> {
  MoreCoursesCubit() : super(MoreCoursesInitial());
}
