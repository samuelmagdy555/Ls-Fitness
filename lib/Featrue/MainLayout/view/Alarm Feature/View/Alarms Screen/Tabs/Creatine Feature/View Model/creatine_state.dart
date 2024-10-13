part of 'creatine_cubit.dart';

@immutable
sealed class CreatineState {}

final class CreatineInitial extends CreatineState {}

final class SetWakeupTime extends CreatineState {}
final class GetWakeupTime extends CreatineState {}

final class SetSleepTime extends CreatineState {}
final class GetSleepTime extends CreatineState {}
