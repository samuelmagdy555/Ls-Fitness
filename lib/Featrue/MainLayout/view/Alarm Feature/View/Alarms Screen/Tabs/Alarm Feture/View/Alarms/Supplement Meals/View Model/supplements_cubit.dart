import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Sleep Alarms/Model/Sleep Model.dart';

part 'supplements_state.dart';

class SupplementsCubit extends Cubit<SupplementsState> {
  SupplementsCubit() : super(SupplementsInitial());

  List<Sleep> Supplement = [
    Sleep(name: 'Protein', time: '00:00' , id: 8),
    Sleep(name: 'Carbs', time: '00:00',id: 9),
    Sleep(name: 'PreWorkout', time: '00:00',id: 10),
    Sleep(name: 'BCAAs ', time: '00:00',id: 11),
    Sleep(name: 'Omega', time: '00:00',id: 12),
    Sleep(name: 'Vitamins', time: '00:00',id: 13),
    Sleep(name: 'Glutamine ', time: '00:00',id: 14),

  ];
}
