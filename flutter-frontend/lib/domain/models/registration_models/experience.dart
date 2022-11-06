import 'package:formz/formz.dart';

enum ExperienceValidationError { empty, notNumeric }

class Experience extends FormzInput<String, ExperienceValidationError> {
  const Experience.pure() : super.pure('');
  const Experience.dirty([super.value = '']) : super.dirty();

  @override
  ExperienceValidationError? validator(String? value) {
    if (value == null) {
      return ExperienceValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return ExperienceValidationError.notNumeric;
    } else {
      return double.tryParse(value)! > 0 ? null : ExperienceValidationError.empty;
    }
  }
}
