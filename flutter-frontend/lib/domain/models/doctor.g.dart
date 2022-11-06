// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      iin: json['iin'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      middlename: json['middlename'] as String,
      contactNumber: json['contactNumber'] as String,
      departmentId: json['departmentId'] as String,
      specializationDetailsId: json['specializationDetailsId'] as String,
      experienceInYears: json['experienceInYears'] as String,
      doctorCategory: json['doctorCategory'] as String,
      priceOfAppointment: json['priceOfAppointment'] as String,
      degree: json['degree'] as String,
      rating: json['rating'] as String,
      address: json['address'] as String,
      homepageUrl: json['homepageUrl'] as String?,
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'iin': instance.iin,
      'name': instance.name,
      'surname': instance.surname,
      'middlename': instance.middlename,
      'contactNumber': instance.contactNumber,
      'departmentId': instance.departmentId,
      'specializationDetailsId': instance.specializationDetailsId,
      'experienceInYears': instance.experienceInYears,
      'doctorCategory': instance.doctorCategory,
      'priceOfAppointment': instance.priceOfAppointment,
      'degree': instance.degree,
      'rating': instance.rating,
      'address': instance.address,
      'homepageUrl': instance.homepageUrl,
    };
