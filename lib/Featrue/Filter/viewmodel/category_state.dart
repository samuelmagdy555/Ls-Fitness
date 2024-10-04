part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class getCategoryLoading extends CategoryState{}
class getCategorySuccess extends CategoryState{}
class getCategoryError extends CategoryState{}
class getBodyPartsLoading extends CategoryState{}
class getBodyPartsSuccess extends CategoryState{}
class getBodyPartsError extends CategoryState{}
