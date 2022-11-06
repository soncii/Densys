import 'package:formz/formz.dart';

enum AddressValidationError { empty }

class Address extends FormzInput<String, AddressValidationError> {
  const Address.pure() : super.pure('');
  const Address.dirty([super.value = '']) : super.dirty();

  @override
  AddressValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : AddressValidationError.empty;
  }
}
