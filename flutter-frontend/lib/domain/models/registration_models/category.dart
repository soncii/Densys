import 'package:formz/formz.dart';

enum DoctorCategoryValidationError { empty }

class DoctorCategory extends FormzInput<String, DoctorCategoryValidationError> {
  const DoctorCategory.pure() : super.pure('');
  const DoctorCategory.dirty([super.value = '']) : super.dirty();

  @override
  DoctorCategoryValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : DoctorCategoryValidationError.empty;
  }
}
