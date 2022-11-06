import 'package:formz/formz.dart';

enum IinValidationError { empty, notNumeric }

class Iin extends FormzInput<String, IinValidationError> {
  const Iin.pure() : super.pure('');
  const Iin.dirty([super.value = '']) : super.dirty();

  @override
  IinValidationError? validator(String? value) {
    if (value == null) {
      return IinValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return IinValidationError.notNumeric;
    }

    return value.length == 12 ? null : IinValidationError.empty;
  }
}