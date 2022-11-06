import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:csci_project/domain/models/doctor.dart';
import 'package:csci_project/domain/models/registration_models/address.dart';
import 'package:csci_project/domain/models/registration_models/category.dart';
import 'package:csci_project/domain/models/registration_models/contactNumber.dart';
import 'package:csci_project/domain/models/registration_models/degree.dart';
import 'package:csci_project/domain/models/registration_models/experience.dart';
import 'package:csci_project/domain/models/registration_models/homepage.dart';
import 'package:csci_project/domain/models/registration_models/id.dart';
import 'package:csci_project/domain/models/registration_models/iin.dart';
import 'package:csci_project/domain/models/registration_models/middlename.dart';
import 'package:csci_project/domain/models/registration_models/name.dart';
// import 'package:csci_project/domain/models/login/doctorCategory.dart';
import 'package:csci_project/domain/models/registration_models/priceOfAppointment.dart';
import 'package:csci_project/domain/models/registration_models/rating.dart';
import 'package:csci_project/domain/models/registration_models/surname.dart';
import 'package:csci_project/domain/repositories/doctor_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:formz/formz.dart';

part 'doctor_register_event.dart';
part 'doctor_register_state.dart';
part 'doctor_register_bloc.freezed.dart';

class DoctorRegisterBloc extends Bloc<DoctorRegisterEvent, DoctorRegisterState> {
  DoctorRegisterBloc()
      : super(DoctorRegisterState(
          dateOfBirth: DateTime.now(),
          iin: Iin.dirty(''),
          name: Name.dirty(''),
          departmentId: Id.dirty(''),
          specializationDetailsId: Id.dirty(''),
          experienceInYears: Experience.dirty(''),
          surname: Surname.dirty(''),
          middlename: Middlename.dirty(''),
          contactNumber: ContactNumber.dirty(''),
          address: Address.dirty(''),
          doctorCategory: DoctorCategory.dirty(''),
          degree: Degree.dirty(''),
          priceOfAppointment: PriceOfAppointment.dirty(''),
          rating: Rating.dirty(''),
          homepageUrl: null,
          status: FormzStatus.pure,
          showValidationError: false,
        )) {
    on<DateOfBirthChanged>(_onDateOfBirthChanged);
    on<IinChanged>(_onIinChanged);
    on<NameChanged>(_onNameChanged);
    on<SurnameChanged>(_onSurnameChanged);
    on<MiddlenameChanged>(_onMiddlenameChanged);
    on<ContactNumberChanged>(_onContactNumberChanged);
    on<DepartmentIdChanged>(_onDepartamentIdChanged);
    on<SpecializationDetailsIdChanged>(_onSpecializationDetailsIdChanged);
    on<ExperienceInYearsChanged>(_onExperienceChanged);
    on<DoctorCategoryChanged>(_onCategoryChanged);
    on<DegreeChanged>(_onDegreeChanged);
    on<PriceOfAppointmentChanged>(_onPriceOfAppointmentChanged);
    on<RatingChanged>(_onRatingChanged);
    on<AddressChanged>(_onAddressChanged);
    on<HomepageUrlChanged>(_onHomepageUrlChanged);
    on<Submit>(_onSubmit);
  }

  final _doctorRepository = DoctorRepository();

  Future<void> _onSubmit(Submit event, Emitter<DoctorRegisterState> emit) async {
    print(state);
    if (state.status.isValidated) {
      print('valid');
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _doctorRepository.registerDoctor(
            doctor: Doctor(
                dateOfBirth: state.dateOfBirth,
                iin: state.iin.value,
                name: state.name.value,
                surname: state.surname.value,
                middlename: state.middlename.value,
                contactNumber: state.contactNumber.value,
                departmentId: state.departmentId.value,
                specializationDetailsId: state.specializationDetailsId.value,
                experienceInYears: state.experienceInYears.value,
                doctorCategory: state.doctorCategory.value,
                priceOfAppointment: state.priceOfAppointment.value,
                degree: state.degree.value,
                rating: state.rating.value,
                address: state.address.value,
                homepageUrl: state.homepageUrl?.value));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(showValidationError: true));
    }
  }

  void _onDateOfBirthChanged(DateOfBirthChanged event, Emitter<DoctorRegisterState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  void _onIinChanged(IinChanged event, Emitter<DoctorRegisterState> emit) {
    final iin = Iin.dirty(event.iin);
    emit(state.copyWith(
        iin: iin,
        status: Formz.validate([
          iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onNameChanged(NameChanged event, Emitter<DoctorRegisterState> emit) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
        name: name,
        status: Formz.validate([
          state.iin,
          name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onSurnameChanged(SurnameChanged event, Emitter<DoctorRegisterState> emit) {
    final surname = Surname.dirty(event.surname);
    emit(state.copyWith(
        surname: surname,
        status: Formz.validate([
          state.iin,
          state.name,
          surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onMiddlenameChanged(MiddlenameChanged event, Emitter<DoctorRegisterState> emit) {
    final middlename = Middlename.dirty(event.middlename);
    emit(state.copyWith(
        middlename: middlename,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onDepartamentIdChanged(DepartmentIdChanged event, Emitter<DoctorRegisterState> emit) {
    final departmentId = Id.dirty(event.departmentId);
    emit(state.copyWith(
        departmentId: departmentId,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onSpecializationDetailsIdChanged(SpecializationDetailsIdChanged event, Emitter<DoctorRegisterState> emit) {
    final specializationDetailsId = Id.dirty(event.specializationDetailsId);
    emit(state.copyWith(
        specializationDetailsId: specializationDetailsId,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onExperienceChanged(ExperienceInYearsChanged event, Emitter<DoctorRegisterState> emit) {
    final experienceInYears = Experience.dirty(event.experienceInYears);
    emit(state.copyWith(
        experienceInYears: experienceInYears,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onContactNumberChanged(ContactNumberChanged event, Emitter<DoctorRegisterState> emit) {
    final contactNumber = ContactNumber.dirty(event.contactNumber);
    emit(state.copyWith(
        contactNumber: contactNumber,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onHomepageUrlChanged(HomepageUrlChanged event, Emitter<DoctorRegisterState> emit) {
    if (event.homepageUrl.isNotEmpty) {
      final homepageUrl = HomepageUrl.dirty(event.homepageUrl);
      emit(state.copyWith(
          homepageUrl: homepageUrl,
          status: Formz.validate([
            state.iin,
            state.name,
            state.surname,
            state.middlename,
            state.contactNumber,
            state.departmentId,
            state.specializationDetailsId,
            state.experienceInYears,
            state.doctorCategory,
            state.priceOfAppointment,
            state.degree,
            state.rating,
            homepageUrl,
            state.address,
          ])));
    } else {
      emit(state.copyWith(
          homepageUrl: null,
          status: Formz.validate([
            state.iin,
            state.name,
            state.surname,
            state.middlename,
            state.contactNumber,
            state.departmentId,
            state.specializationDetailsId,
            state.experienceInYears,
            state.doctorCategory,
            state.priceOfAppointment,
            state.degree,
            state.rating,
            state.address,
          ])));
    }
  }

  void _onAddressChanged(AddressChanged event, Emitter<DoctorRegisterState> emit) {
    final address = Address.dirty(event.address);
    emit(state.copyWith(
        address: address,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          address,
        ])));
  }

  void _onCategoryChanged(DoctorCategoryChanged event, Emitter<DoctorRegisterState> emit) {
    final doctorCategory = DoctorCategory.dirty(event.doctorCategory);
    emit(state.copyWith(
        doctorCategory: doctorCategory,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          doctorCategory,
          state.priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onPriceOfAppointmentChanged(PriceOfAppointmentChanged event, Emitter<DoctorRegisterState> emit) {
    final priceOfAppointment = PriceOfAppointment.dirty(event.priceOfAppointment);
    emit(state.copyWith(
        priceOfAppointment: priceOfAppointment,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          priceOfAppointment,
          state.degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onRatingChanged(RatingChanged event, Emitter<DoctorRegisterState> emit) {
    final rating = Rating.dirty(event.rating);
    emit(state.copyWith(
        rating: rating,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          state.degree,
          rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }

  void _onDegreeChanged(DegreeChanged event, Emitter<DoctorRegisterState> emit) {
    final degree = Degree.dirty(event.degree);
    emit(state.copyWith(
        degree: degree,
        status: Formz.validate([
          state.iin,
          state.name,
          state.surname,
          state.middlename,
          state.contactNumber,
          state.departmentId,
          state.specializationDetailsId,
          state.experienceInYears,
          state.doctorCategory,
          state.priceOfAppointment,
          degree,
          state.rating,
          state.homepageUrl ?? HomepageUrl.dirty(''),
          state.address,
        ])));
  }
}
