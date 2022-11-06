import 'package:formz/formz.dart';

enum MiddlenameValidationError { empty }

class Middlename extends FormzInput<String, MiddlenameValidationError> {
  const Middlename.pure() : super.pure('');
  const Middlename.dirty([super.value = '']) : super.dirty();

  @override
  MiddlenameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MiddlenameValidationError.empty;
  }
}
