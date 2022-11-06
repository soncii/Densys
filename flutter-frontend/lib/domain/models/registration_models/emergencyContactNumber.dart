import 'package:formz/formz.dart';

enum EmergencyContactNumberValidationError { empty, notNumeric }

class EmergencyContactNumber extends FormzInput<String, EmergencyContactNumberValidationError> {
  const EmergencyContactNumber.pure() : super.pure('');
  const EmergencyContactNumber.dirty([super.value = '']) : super.dirty();

  @override
  EmergencyContactNumberValidationError? validator(String? value) {
    if (value == null) {
      return EmergencyContactNumberValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return EmergencyContactNumberValidationError.notNumeric;
    }

    return (value.length == 12 || value.length == 11)  ? null : EmergencyContactNumberValidationError.empty;
  }
}
