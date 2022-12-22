import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospitallist/models/hospital_list_model.dart';

import '../resources/hospital_repository.dart';

part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  HospitalListBloc() : super(HospitalListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetCovidList>((event, emit) async {
      try {
        emit(HospitalListLoading());
        final List<HospitalListModel> mList = await _apiRepository.fetchHospitalList();
        emit(HospitalListLoaded(mList));
      } on NetworkError {
        emit(HospitalListError("Failed to fetch data. is your device online?"));
      }
    });
  }
}