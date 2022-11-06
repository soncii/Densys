import 'package:bloc/bloc.dart';
import 'package:csci_project/domain/models/patient.dart';
import 'package:csci_project/domain/repositories/patient_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_search_event.dart';
part 'patient_search_state.dart';
part 'patient_search_bloc.freezed.dart';

class PatientSearchBloc extends Bloc<PatientSearchEvent, PatientSearchState> {
  PatientSearchBloc() : super(PatientSearchState(hasReachedMax: false, patientsList: [], page: 0, status: PatientSearchStatus.initial)) {
    on<Fetch>(_onFetch);
  }

  final _patientRepo = PatientRepository();

  Future<void> _onFetch(Fetch event, Emitter<PatientSearchState> emit) async {
    // print(state.patientsList);
    if (state.status == PatientSearchStatus.initial) {
      final patients = await _patientRepo.getPatients(page: state.page, perPage: 2);
      return emit(state.copyWith(
        status: PatientSearchStatus.success,
        patientsList: patients,
        page: state.page + 1,
        hasReachedMax: false,
      ));
    }
    final patients = await _patientRepo.getPatients(page: state.page, perPage: 2);

    emit(patients.isEmpty
        ? state.copyWith(hasReachedMax: true)
        : state.copyWith(
            status: PatientSearchStatus.success,
            page: state.page + 1,
            patientsList: List.of(state.patientsList)..addAll(patients),
            hasReachedMax: false,
          ));
  }
}
