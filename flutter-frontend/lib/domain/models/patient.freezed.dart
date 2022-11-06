// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doB')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'iIN')
  int? get iin => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  @JsonKey(name: 'middleName')
  String? get middlename => throw _privateConstructorUsedError;
  String? get bloodGroup => throw _privateConstructorUsedError;
  String? get emergencyContactNumber => throw _privateConstructorUsedError;
  String? get contactNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'married')
  String? get maritalStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'doB') DateTime? dateOfBirth,
      @JsonKey(name: 'iIN') int? iin,
      @JsonKey(name: 'firstName') String? name,
      String? surname,
      @JsonKey(name: 'middleName') String? middlename,
      String? bloodGroup,
      String? emergencyContactNumber,
      String? contactNumber,
      String? email,
      String? address,
      @JsonKey(name: 'married') String? maritalStatus});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateOfBirth = freezed,
    Object? iin = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? middlename = freezed,
    Object? bloodGroup = freezed,
    Object? emergencyContactNumber = freezed,
    Object? contactNumber = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? maritalStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iin: freezed == iin
          ? _value.iin
          : iin // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _value.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactNumber: freezed == emergencyContactNumber
          ? _value.emergencyContactNumber
          : emergencyContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$_PatientCopyWith(
          _$_Patient value, $Res Function(_$_Patient) then) =
      __$$_PatientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'doB') DateTime? dateOfBirth,
      @JsonKey(name: 'iIN') int? iin,
      @JsonKey(name: 'firstName') String? name,
      String? surname,
      @JsonKey(name: 'middleName') String? middlename,
      String? bloodGroup,
      String? emergencyContactNumber,
      String? contactNumber,
      String? email,
      String? address,
      @JsonKey(name: 'married') String? maritalStatus});
}

/// @nodoc
class __$$_PatientCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$_Patient>
    implements _$$_PatientCopyWith<$Res> {
  __$$_PatientCopyWithImpl(_$_Patient _value, $Res Function(_$_Patient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateOfBirth = freezed,
    Object? iin = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? middlename = freezed,
    Object? bloodGroup = freezed,
    Object? emergencyContactNumber = freezed,
    Object? contactNumber = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? maritalStatus = freezed,
  }) {
    return _then(_$_Patient(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iin: freezed == iin
          ? _value.iin
          : iin // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _value.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactNumber: freezed == emergencyContactNumber
          ? _value.emergencyContactNumber
          : emergencyContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patient implements _Patient {
  _$_Patient(
      {this.id,
      @JsonKey(name: 'doB') required this.dateOfBirth,
      @JsonKey(name: 'iIN') required this.iin,
      @JsonKey(name: 'firstName') required this.name,
      required this.surname,
      @JsonKey(name: 'middleName') required this.middlename,
      required this.bloodGroup,
      required this.emergencyContactNumber,
      required this.contactNumber,
      this.email,
      required this.address,
      @JsonKey(name: 'married') required this.maritalStatus});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'doB')
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'iIN')
  final int? iin;
  @override
  @JsonKey(name: 'firstName')
  final String? name;
  @override
  final String? surname;
  @override
  @JsonKey(name: 'middleName')
  final String? middlename;
  @override
  final String? bloodGroup;
  @override
  final String? emergencyContactNumber;
  @override
  final String? contactNumber;
  @override
  final String? email;
  @override
  final String? address;
  @override
  @JsonKey(name: 'married')
  final String? maritalStatus;

  @override
  String toString() {
    return 'Patient(id: $id, dateOfBirth: $dateOfBirth, iin: $iin, name: $name, surname: $surname, middlename: $middlename, bloodGroup: $bloodGroup, emergencyContactNumber: $emergencyContactNumber, contactNumber: $contactNumber, email: $email, address: $address, maritalStatus: $maritalStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Patient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.iin, iin) || other.iin == iin) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.emergencyContactNumber, emergencyContactNumber) ||
                other.emergencyContactNumber == emergencyContactNumber) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dateOfBirth,
      iin,
      name,
      surname,
      middlename,
      bloodGroup,
      emergencyContactNumber,
      contactNumber,
      email,
      address,
      maritalStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      __$$_PatientCopyWithImpl<_$_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  factory _Patient(
          {final int? id,
          @JsonKey(name: 'doB') required final DateTime? dateOfBirth,
          @JsonKey(name: 'iIN') required final int? iin,
          @JsonKey(name: 'firstName') required final String? name,
          required final String? surname,
          @JsonKey(name: 'middleName') required final String? middlename,
          required final String? bloodGroup,
          required final String? emergencyContactNumber,
          required final String? contactNumber,
          final String? email,
          required final String? address,
          @JsonKey(name: 'married') required final String? maritalStatus}) =
      _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'doB')
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: 'iIN')
  int? get iin;
  @override
  @JsonKey(name: 'firstName')
  String? get name;
  @override
  String? get surname;
  @override
  @JsonKey(name: 'middleName')
  String? get middlename;
  @override
  String? get bloodGroup;
  @override
  String? get emergencyContactNumber;
  @override
  String? get contactNumber;
  @override
  String? get email;
  @override
  String? get address;
  @override
  @JsonKey(name: 'married')
  String? get maritalStatus;
  @override
  @JsonKey(ignore: true)
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}
