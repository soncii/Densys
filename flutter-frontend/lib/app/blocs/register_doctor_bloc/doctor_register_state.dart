part of 'doctor_register_bloc.dart';

@freezed
class DoctorRegisterState with _$DoctorRegisterState {
  const factory DoctorRegisterState(
      {required DateTime dateOfBirth,
      required Iin iin,
      required Name name,
      required Surname surname,
      required Middlename middlename,
      required Id departmentId,
      required Id specializationDetailsId,
      required Experience experienceInYears,
      required DoctorCategory doctorCategory,
      required PriceOfAppointment priceOfAppointment,
      required Degree degree,
      required Rating rating,
      required ContactNumber contactNumber,
      required Address address,
      required HomepageUrl? homepageUrl,
      required FormzStatus status,
      required bool showValidationError}) = _DoctorRegisterState;
}
