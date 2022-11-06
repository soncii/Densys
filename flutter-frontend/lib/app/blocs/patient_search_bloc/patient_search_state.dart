part of 'patient_search_bloc.dart';

enum PatientSearchStatus { initial, success, failure }

@freezed
class PatientSearchState with _$PatientSearchState {
  const factory PatientSearchState({
    required PatientSearchStatus status,
    required int page,
    required List<Patient> patientsList,
    required bool hasReachedMax,
  }) = _PatientSearchState;
}
