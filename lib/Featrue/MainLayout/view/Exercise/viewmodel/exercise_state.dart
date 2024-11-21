part of 'exercise_cubit.dart';

@immutable
abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class GetExerciseSuccess extends ExerciseState{}
class GetExerciseLoading extends ExerciseState{}
class GetExerciseError extends ExerciseState{}

class BodyPartsSuccess extends ExerciseState{}
class BodyPartsError extends ExerciseState{}
class BodyPartsLoading extends ExerciseState{}
class ShowWarmUpState extends ExerciseState{}
