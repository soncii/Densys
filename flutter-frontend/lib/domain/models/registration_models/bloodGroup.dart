import 'package:formz/formz.dart';

enum BloodGroupValidationError { empty }

class BloodGroup extends FormzInput<String, BloodGroupValidationError> {
  const BloodGroup.pure() : super.pure('');
  const BloodGroup.dirty([super.value = '']) : super.dirty();

  @override
  BloodGroupValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : BloodGroupValidationError.empty;
  }
}
