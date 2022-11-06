import 'package:formz/formz.dart';

enum PriceOfAppointmentValidationError { empty, notNumeric }

class PriceOfAppointment extends FormzInput<String, PriceOfAppointmentValidationError> {
  const PriceOfAppointment.pure() : super.pure('');
  const PriceOfAppointment.dirty([super.value = '']) : super.dirty();

  @override
  PriceOfAppointmentValidationError? validator(String? value) {
    if (value == null) {
      return PriceOfAppointmentValidationError.empty;
    }
    if (int.tryParse(value) == null) {
      return PriceOfAppointmentValidationError.notNumeric;
    } else {
      return int.tryParse(value)! > 0 ? null : PriceOfAppointmentValidationError.empty;
    }
  }
}
