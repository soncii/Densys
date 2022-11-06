part of 'modify_patient_bloc.dart';


@freezed
class ModifyPatientState with _$ModifyPatientState {
  const factory ModifyPatientState(
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
      required bool showValidationError}) = _ModifyPatientState;
}
