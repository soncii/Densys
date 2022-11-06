import 'package:formz/formz.dart';

enum MaritalStatusValidationError { empty }

class MaritalStatus extends FormzInput<String, MaritalStatusValidationError> {
  const MaritalStatus.pure() : super.pure('');
  const MaritalStatus.dirty([super.value = '']) : super.dirty();

  @override
  MaritalStatusValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : MaritalStatusValidationError.empty;
  }
}
