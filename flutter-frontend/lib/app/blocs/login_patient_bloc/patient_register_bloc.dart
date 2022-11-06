import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:csci_project/domain/models/patient.dart';
import 'package:csci_project/domain/models/registration_models/address.dart';
import 'package:csci_project/domain/models/registration_models/bloodGroup.dart';
import 'package:csci_project/domain/models/registration_models/contactNumber.dart';
import 'package:csci_project/domain/models/registration_models/email.dart';
import 'package:csci_project/domain/models/registration_models/emergencyContactNumber.dart';
import 'package:csci_project/domain/models/registration_models/id.dart';
import 'package:csci_project/domain/models/registration_models/iin.dart';
import 'package:csci_project/domain/models/registration_models/maritalStatus.dart';
import 'package:csci_project/domain/models/registration_models/middlename.dart';
import 'package:csci_project/domain/models/registration_models/name.dart';
import 'package:csci_project/domain/models/registration_models/surname.dart';
import 'package:csci_project/domain/repositories/patient_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:formz/formz.dart';

part 'patient_register_event.dart';
part 'patient_register_state.dart';
part 'patient_register_bloc.freezed.dart';

class PatientRegisterBloc extends Bloc<PatientRegisterEvent, PatientRegisterState> {
  PatientRegisterBloc()
      : super(PatientRegisterState(
            dateOfBirth: DateTime.now(),
            iin: Iin.dirty(''),
            id: Id.dirty(''),
            name: Name.dirty(''),
            surname: Surname.dirty(''),
            middlename: Middlename.dirty(''),
            bloodGroup: BloodGroup.dirty(''),
            emergencyContactNumber: EmergencyContactNumber.dirty(''),
            contactNumber: ContactNumber.dirty(''),
            email: null,
            address: Address.dirty(''),
            maritalStatus: MaritalStatus.dirty(''),
            status: FormzStatus.pure,
            showValidationError: false)) {
    on<DateOfBirthChanged>(_onDateOfBirthChanged);
    on<IinChanged>(_onIinChanged);
    on<IdChanged>(_onIdChanged);
    on<NameChanged>(_onNameChanged);
    on<SurnameChanged>(_onSurnameChanged);
    on<MiddlenameChanged>(_onMiddlenameChanged);
    on<BloodGroupChanged>(_onBloodGroupChanged);
    on<EmergencyContactNumberChanged>(_onEmergencyContactChanged);
    on<ContactNumberChanged>(_onContactNumberChanged);
    on<EmailChanged>(_onEmailChanged);
    on<AddressChanged>(_onAddressChanged);
    on<MaritialStatusChanged>(_onMaritalStatusChanged);
    on<Submit>(_onSubmit);
  }

  final _patientRepository = PatientRepository();

  Future<void> _onSubmit(Submit event, Emitter<PatientRegisterState> emit) async {
    print(state);
    if (state.status.isValidated) {
      print('valid patient');
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _patientRepository.registerPatient(
            patient: Patient(
                dateOfBirth: state.dateOfBirth,
                iin: int.tryParse(state.iin.value),
                name: state.name.value,
                surname: state.surname.value,
                middlename: state.middlename.value,
                bloodGroup: state.bloodGroup.value,
                emergencyContactNumber: state.emergencyContactNumber.value,
                contactNumber: state.contactNumber.value,
                email: state.email?.value,
                address: state.address.value,
                maritalStatus: state.maritalStatus.value));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(showValidationError: true));
    }
  }

  void _onDateOfBirthChanged(DateOfBirthChanged event, Emitter<PatientRegisterState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  void _onIinChanged(IinChanged event, Emitter<PatientRegisterState> emit) {
    final iin = Iin.dirty(event.iin);
    emit(state.copyWith(
        iin: iin,
        status: Formz.validate([
          iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onIdChanged(IdChanged event, Emitter<PatientRegisterState> emit) {
    final id = Id.dirty(event.id);
    emit(state.copyWith(
        id: id,
        status: Formz.validate([
          state.iin,
          id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onNameChanged(NameChanged event, Emitter<PatientRegisterState> emit) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
        name: name,
        status: Formz.validate([
          state.iin,
          state.id,
          name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onSurnameChanged(SurnameChanged event, Emitter<PatientRegisterState> emit) {
    final surname = Surname.dirty(event.surname);
    emit(state.copyWith(
        surname: surname,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onMiddlenameChanged(MiddlenameChanged event, Emitter<PatientRegisterState> emit) {
    final middlename = Middlename.dirty(event.middlename);
    emit(state.copyWith(
        middlename: middlename,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onBloodGroupChanged(BloodGroupChanged event, Emitter<PatientRegisterState> emit) {
    final bloodGroup = BloodGroup.dirty(event.bloodGroup);
    emit(state.copyWith(
        bloodGroup: bloodGroup,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onEmergencyContactChanged(EmergencyContactNumberChanged event, Emitter<PatientRegisterState> emit) {
    final emergencyContactNumber = EmergencyContactNumber.dirty(event.emergencyContactNumber);
    emit(state.copyWith(
        emergencyContactNumber: emergencyContactNumber,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onContactNumberChanged(ContactNumberChanged event, Emitter<PatientRegisterState> emit) {
    final contactNumber = ContactNumber.dirty(event.contactNumber);
    emit(state.copyWith(
        contactNumber: contactNumber,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          state.maritalStatus
        ])));
  }

  void _onEmailChanged(EmailChanged event, Emitter<PatientRegisterState> emit) {
    if (event.email.isNotEmpty) {
      final email = Email.dirty(event.email);
      emit(state.copyWith(
          email: email,
          status: Formz.validate([
            state.iin,
            state.id,
            state.name,
            state.surname,
            state.middlename,
            state.bloodGroup,
            state.emergencyContactNumber,
            state.contactNumber,
            email,
            state.address,
            state.maritalStatus
          ])));
    } else {
      emit(state.copyWith(
          email: null,
          status: Formz.validate([
            state.iin,
            state.id,
            state.name,
            state.surname,
            state.middlename,
            state.bloodGroup,
            state.emergencyContactNumber,
            state.contactNumber,
            state.address,
            state.maritalStatus
          ])));
    }
  }

  void _onAddressChanged(AddressChanged event, Emitter<PatientRegisterState> emit) {
    final address = Address.dirty(event.address);
    emit(state.copyWith(
        address: address,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          address,
          state.maritalStatus
        ])));
  }

  void _onMaritalStatusChanged(MaritialStatusChanged event, Emitter<PatientRegisterState> emit) {
    final maritalStatus = MaritalStatus.dirty(event.maritalStatus);
    emit(state.copyWith(
        maritalStatus: maritalStatus,
        status: Formz.validate([
          state.iin,
          state.id,
          state.name,
          state.surname,
          state.middlename,
          state.bloodGroup,
          state.emergencyContactNumber,
          state.contactNumber,
          state.email ?? Email.dirty(''),
          state.address,
          maritalStatus
        ])));
  }
}
