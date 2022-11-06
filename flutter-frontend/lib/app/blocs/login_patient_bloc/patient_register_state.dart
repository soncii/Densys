part of 'patient_register_bloc.dart';

@freezed
class PatientRegisterState with _$PatientRegisterState {
  const factory PatientRegisterState(
      {required DateTime dateOfBirth,
      required Iin iin,
      required Id id,
      required Name name,
      required Surname surname,
      required Middlename middlename,
      required BloodGroup bloodGroup,
      required EmergencyContactNumber emergencyContactNumber,
      required ContactNumber contactNumber,
      required Email? email,
      required Address address,
      required MaritalStatus maritalStatus,
      required FormzStatus status,
      required bool showValidationError}) = _PatientRegisterState;
}
