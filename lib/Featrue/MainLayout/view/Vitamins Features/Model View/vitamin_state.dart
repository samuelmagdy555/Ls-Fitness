part of 'vitamin_cubit.dart';

@immutable
sealed class VitaminState {}

final class VitaminInitial extends VitaminState {}


final class GetVitaminLoading extends VitaminState {}
final class GetVitaminSuccess extends VitaminState {}
final class GetVitaminError extends VitaminState {}
