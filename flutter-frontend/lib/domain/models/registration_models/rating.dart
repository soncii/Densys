import 'package:formz/formz.dart';

enum RatingValidationError { empty, notNumeric }

class Rating extends FormzInput<String, RatingValidationError> {
  const Rating.pure() : super.pure('');
  const Rating.dirty([super.value = '']) : super.dirty();

  @override
  RatingValidationError? validator(String? value) {
    if (value == null) {
      return RatingValidationError.empty;
    }
    if (double.tryParse(value) == null) {
      return RatingValidationError.notNumeric;
    } else {
      return (double.tryParse(value)! > 0 && double.tryParse(value)! <= 10)  ? null : RatingValidationError.empty;
    }
  }
}
