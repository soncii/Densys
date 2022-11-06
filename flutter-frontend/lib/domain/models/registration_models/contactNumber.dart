import 'package:formz/formz.dart';

enum ContactNumberValidationError { empty, notNumeric }

class ContactNumber extends FormzInput<String, ContactNumberValidationError> {
  const ContactNumber.pure() : super.pure('');
  const ContactNumber.dirty([super.value = '']) : super.dirty();

  @override
  ContactNumberValidationError? validator(String? value) {
    if (value == null) {
      return ContactNumberValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return ContactNumberValidationError.notNumeric;
    }

    return (value.length == 12 || value.length == 11) ? null : ContactNumberValidationError.empty;
  }
}
