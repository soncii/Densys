import 'package:formz/formz.dart';

enum DegreeValidationError { empty }

class Degree extends FormzInput<String, DegreeValidationError> {
  const Degree.pure() : super.pure('');
  const Degree.dirty([super.value = '']) : super.dirty();

  @override
  DegreeValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : DegreeValidationError.empty;
  }
}
