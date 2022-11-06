part of 'doctor_register_bloc.dart';

@freezed
class DoctorRegisterEvent with _$DoctorRegisterEvent {
  const factory DoctorRegisterEvent.dateOfBirthChanged({required DateTime dateOfBirth}) = DateOfBirthChanged;
  const factory DoctorRegisterEvent.iinChanged({required String iin}) = IinChanged;
  const factory DoctorRegisterEvent.nameChanged({required String name}) = NameChanged;
  const factory DoctorRegisterEvent.surnameChanged({required String surname}) = SurnameChanged;
  const factory DoctorRegisterEvent.middlenameChanged({required String middlename}) = MiddlenameChanged;
  const factory DoctorRegisterEvent.contactNumberChanged({required String contactNumber}) = ContactNumberChanged;

  const factory DoctorRegisterEvent.departmentIdChanged({required String departmentId}) = DepartmentIdChanged;
  const factory DoctorRegisterEvent.specializationDetailsIdChanged({required String specializationDetailsId}) = SpecializationDetailsIdChanged;
  const factory DoctorRegisterEvent.experienceInYearChanged({required String experienceInYears}) = ExperienceInYearsChanged;
  const factory DoctorRegisterEvent.doctorCategoryChanged({required String doctorCategory}) = DoctorCategoryChanged;
  const factory DoctorRegisterEvent.priceOfAppointmentChanged({required String priceOfAppointment}) = PriceOfAppointmentChanged;
  const factory DoctorRegisterEvent.degreeChanged({required String degree}) = DegreeChanged;
  const factory DoctorRegisterEvent.ratingChanged({required String rating}) = RatingChanged;

  const factory DoctorRegisterEvent.addressChanged({required String address}) = AddressChanged;
  const factory DoctorRegisterEvent.homepageUrlChanged({required String homepageUrl}) = HomepageUrlChanged;

  const factory DoctorRegisterEvent.submit() = Submit;
}
