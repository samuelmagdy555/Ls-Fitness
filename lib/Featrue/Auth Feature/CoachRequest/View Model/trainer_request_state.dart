part of 'trainer_request_cubit.dart';

@immutable
sealed class TrainerRequestState {}

final class TrainerRequestInitial extends TrainerRequestState {}

final class requestToBeTrainerLoading extends TrainerRequestState {}
final class requestToBeTrainerSuccess extends TrainerRequestState {}
final class requestToBeTrainerError extends TrainerRequestState {}
