// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      id: json['id'] as int?,
      dateOfBirth:
          json['doB'] == null ? null : DateTime.parse(json['doB'] as String),
      iin: json['iIN'] as int?,
      name: json['firstName'] as String?,
      surname: json['surname'] as String?,
      middlename: json['middleName'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      emergencyContactNumber: json['emergencyContactNumber'] as String?,
      contactNumber: json['contactNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      maritalStatus: json['married'] as String?,
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doB': instance.dateOfBirth?.toIso8601String(),
      'iIN': instance.iin,
      'firstName': instance.name,
      'surname': instance.surname,
      'middleName': instance.middlename,
      'bloodGroup': instance.bloodGroup,
      'emergencyContactNumber': instance.emergencyContactNumber,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'address': instance.address,
      'married': instance.maritalStatus,
    };
