part of 'modify_patient_bloc.dart';

@freezed
class ModifyPatientEvent with _$ModifyPatientEvent {
  const factory ModifyPatientEvent.start() = Start;

  const factory ModifyPatientEvent.dateOfBirthChanged({required DateTime dateOfBirth}) = DateOfBirthChanged;
  const factory ModifyPatientEvent.iinChanged({required String iin}) = IinChanged;
  const factory ModifyPatientEvent.nameChanged({required String name}) = NameChanged;
  const factory ModifyPatientEvent.surnameChanged({required String surname}) = SurnameChanged;
  const factory ModifyPatientEvent.middlenameChanged({required String middlename}) = MiddlenameChanged;
  const factory ModifyPatientEvent.bloodGroupChanged({required String bloodGroup}) = BloodGroupChanged;
  const factory ModifyPatientEvent.emergencyContactNumberChanged({required String emergencyContactNumber}) = EmergencyContactNumberChanged;
  const factory ModifyPatientEvent.contactNumberChanged({required String contactNumber}) = ContactNumberChanged;
  const factory ModifyPatientEvent.emailChanged({required String email}) = EmailChanged;
  const factory ModifyPatientEvent.addressChanged({required String address}) = AddressChanged;
  const factory ModifyPatientEvent.maritalStatusChanged({required String maritalStatus}) = MaritialStatusChanged;

  const factory ModifyPatientEvent.submit() = Submit;
}
