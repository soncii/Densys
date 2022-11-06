part of 'patient_register_bloc.dart';

@freezed
class PatientRegisterEvent with _$PatientRegisterEvent {
  const factory PatientRegisterEvent.dateOfBirthChanged({required DateTime dateOfBirth}) = DateOfBirthChanged;
  const factory PatientRegisterEvent.iinChanged({required String iin}) = IinChanged;
  const factory PatientRegisterEvent.idChanged({required String id}) = IdChanged;
  const factory PatientRegisterEvent.nameChanged({required String name}) = NameChanged;
  const factory PatientRegisterEvent.surnameChanged({required String surname}) = SurnameChanged;
  const factory PatientRegisterEvent.middlenameChanged({required String middlename}) = MiddlenameChanged;
  const factory PatientRegisterEvent.bloodGroupChanged({required String bloodGroup}) = BloodGroupChanged;
  const factory PatientRegisterEvent.emergencyContactNumberChanged({required String emergencyContactNumber}) = EmergencyContactNumberChanged;
  const factory PatientRegisterEvent.contactNumberChanged({required String contactNumber}) = ContactNumberChanged;
  const factory PatientRegisterEvent.emailChanged({required String email}) = EmailChanged;
  const factory PatientRegisterEvent.addressChanged({required String address}) = AddressChanged;
  const factory PatientRegisterEvent.maritalStatusChanged({required String maritalStatus}) = MaritialStatusChanged;

  const factory PatientRegisterEvent.submit() = Submit;
}
