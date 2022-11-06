import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  factory Patient({
    int? id,
    @JsonKey(name: 'doB') required DateTime? dateOfBirth,
    @JsonKey(name: 'iIN') required int? iin,
    @JsonKey(name: 'firstName') required String? name,
    required String? surname,
    @JsonKey(name: 'middleName') required String? middlename,
    required String? bloodGroup,
    required String? emergencyContactNumber,
    required String? contactNumber,
    String? email,
    required String? address,
    @JsonKey(name: 'married') required String? maritalStatus,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
