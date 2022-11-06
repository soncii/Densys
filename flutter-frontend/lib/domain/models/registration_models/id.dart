import 'package:formz/formz.dart';

enum IdValidationError { empty, notNumeric }

class Id extends FormzInput<String, IdValidationError> {
  const Id.pure() : super.pure('');
  const Id.dirty([super.value = '']) : super.dirty();

  @override
  IdValidationError? validator(String? value) {
    if (value == null) {
      return IdValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return IdValidationError.notNumeric;
    } else {
      return double.tryParse(value)! > 0 ? null : IdValidationError.empty;
    }
  }
}
