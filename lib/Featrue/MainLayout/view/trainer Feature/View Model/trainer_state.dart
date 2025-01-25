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

final class SubscribeTrainerLoading extends TrainerState {}
final class SubscribeTrainerSuccess extends TrainerState {}
final class SubscribeTrainerError extends TrainerState {}

final class BuyTrainerPlanSuccess extends TrainerState {}
final class BuyTrainerPlanLoading extends TrainerState {}
final class BuyTrainerPlanError extends TrainerState {}
