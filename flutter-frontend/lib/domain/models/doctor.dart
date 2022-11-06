import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required DateTime dateOfBirth,
    required String iin,
    required String name,
    required String surname,
    required String middlename,
    required String contactNumber,
    required String departmentId,
    required String specializationDetailsId,
    required String experienceInYears,
    required String doctorCategory,
    required String priceOfAppointment,
    required String degree,
    required String rating,
    required String address,
    required String? homepageUrl,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
