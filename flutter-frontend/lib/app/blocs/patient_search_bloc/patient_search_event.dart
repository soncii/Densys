part of 'patient_search_bloc.dart';

@freezed
class PatientSearchEvent with _$PatientSearchEvent {
  const factory PatientSearchEvent.fetch() = Fetch;
}