import 'package:formz/formz.dart';

enum HomepageUrlValidationError { invalidUrlForm }

class HomepageUrl extends FormzInput<String, HomepageUrlValidationError> {
  const HomepageUrl.pure() : super.pure('');
  const HomepageUrl.dirty([super.value = '']) : super.dirty();

  @override
  HomepageUrlValidationError? validator(String? value) {
    if (value != null) {
      if (value.isEmpty) return null;
      return RegExp(r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?').hasMatch(value)
          ? null
          : HomepageUrlValidationError.invalidUrlForm;
    }
    return null;
  }
}
