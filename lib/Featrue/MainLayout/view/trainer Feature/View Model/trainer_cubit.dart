import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());
}
