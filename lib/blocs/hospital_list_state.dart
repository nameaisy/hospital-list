part of 'hospital_list_bloc.dart';


abstract class HospitalListState extends Equatable {
  const HospitalListState();

  @override
  List<Object?> get props => [];
}

class HospitalListInitial extends HospitalListState {}

class HospitalListLoading extends HospitalListState {}

class HospitalListLoaded extends HospitalListState {
  final List<HospitalListModel> hospitalListModel;
  const HospitalListLoaded(this.hospitalListModel);
}

class HospitalListError extends HospitalListState {
  final String? message;
  const HospitalListError(this.message);
}