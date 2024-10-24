import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/PrgoressModel.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(ProgressInitial());

  static ProgressCubit get(context) => BlocProvider.of(context);

  String? selectedValue;
  ProgressModel? progressModel;
  List<FlSpot> spots = [];

  Future<void> getExercisesProgress({required String id}) async {
    emit(GetProgressLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: '${EndPoints.Progress}/$id',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      progressModel = ProgressModel.fromJson(response.data);
      emit(GetProgressSuccess());
    } catch (e) {
      emit(GetProgressError());
    }
  }

  void generateSpots(List<int> volumes) {
    spots.clear();

    if (volumes.isEmpty) {
      print("The volumes list is empty, no spots generated.");
      return;
    }

    int firstVolume = volumes.first - 10;
    volumes.insert(0, firstVolume);

    int lastVolume = volumes.last + 10;
    volumes.add(lastVolume);

    for (int i = 0; i < volumes.length; i++) {
      spots.add(FlSpot(i * 10.0, volumes[i].toDouble()));
    }

    print(spots);

    emit(ListOfChartsDone());
    volumes.clear();
  }
}
