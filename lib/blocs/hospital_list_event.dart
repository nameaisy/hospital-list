part of 'hospital_list_bloc.dart';


abstract class HospitalListEvent extends Equatable {
  const HospitalListEvent();

  @override
  List<Object> get props => [];
}

class GetCovidList extends HospitalListEvent {}