part of 'terms_and_conditions_cubit.dart';

@immutable
abstract class TermsAndConditionsState {}

class TermsAndConditionsInitial extends TermsAndConditionsState {}

class TermsAndConditionsSuccess extends TermsAndConditionsState{}
class TermsAndConditionsError extends TermsAndConditionsState{}
class TermsAndConditionsLoading extends TermsAndConditionsState{}
