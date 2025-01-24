part of 'trainer_cubit.dart';

@immutable
sealed class TrainerState {}

final class TrainerInitial extends TrainerState {}

final class GetTrainerDataLoading extends TrainerState {}
final class GetTrainerDataSuccess extends TrainerState {}
final class GetTrainerDataError extends TrainerState {}

final class GetDetailsTrainerDataLoading extends TrainerState {}
final class GetDetailsTrainerDataSuccess extends TrainerState {}
final class GetDetailsTrainerDataError extends TrainerState {}
