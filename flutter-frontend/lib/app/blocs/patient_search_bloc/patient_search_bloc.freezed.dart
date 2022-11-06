// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientSearchEventCopyWith<$Res> {
  factory $PatientSearchEventCopyWith(
          PatientSearchEvent value, $Res Function(PatientSearchEvent) then) =
      _$PatientSearchEventCopyWithImpl<$Res, PatientSearchEvent>;
}

/// @nodoc
class _$PatientSearchEventCopyWithImpl<$Res, $Val extends PatientSearchEvent>
    implements $PatientSearchEventCopyWith<$Res> {
  _$PatientSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchCopyWith<$Res> {
  factory _$$FetchCopyWith(_$Fetch value, $Res Function(_$Fetch) then) =
      __$$FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCopyWithImpl<$Res>
    extends _$PatientSearchEventCopyWithImpl<$Res, _$Fetch>
    implements _$$FetchCopyWith<$Res> {
  __$$FetchCopyWithImpl(_$Fetch _value, $Res Function(_$Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Fetch implements Fetch {
  const _$Fetch();

  @override
  String toString() {
    return 'PatientSearchEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class Fetch implements PatientSearchEvent {
  const factory Fetch() = _$Fetch;
}

/// @nodoc
mixin _$PatientSearchState {
  PatientSearchStatus get status => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<Patient> get patientsList => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientSearchStateCopyWith<PatientSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientSearchStateCopyWith<$Res> {
  factory $PatientSearchStateCopyWith(
          PatientSearchState value, $Res Function(PatientSearchState) then) =
      _$PatientSearchStateCopyWithImpl<$Res, PatientSearchState>;
  @useResult
  $Res call(
      {PatientSearchStatus status,
      int page,
      List<Patient> patientsList,
      bool hasReachedMax});
}

/// @nodoc
class _$PatientSearchStateCopyWithImpl<$Res, $Val extends PatientSearchState>
    implements $PatientSearchStateCopyWith<$Res> {
  _$PatientSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? patientsList = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PatientSearchStatus,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      patientsList: null == patientsList
          ? _value.patientsList
          : patientsList // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientSearchStateCopyWith<$Res>
    implements $PatientSearchStateCopyWith<$Res> {
  factory _$$_PatientSearchStateCopyWith(_$_PatientSearchState value,
          $Res Function(_$_PatientSearchState) then) =
      __$$_PatientSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PatientSearchStatus status,
      int page,
      List<Patient> patientsList,
      bool hasReachedMax});
}

/// @nodoc
class __$$_PatientSearchStateCopyWithImpl<$Res>
    extends _$PatientSearchStateCopyWithImpl<$Res, _$_PatientSearchState>
    implements _$$_PatientSearchStateCopyWith<$Res> {
  __$$_PatientSearchStateCopyWithImpl(
      _$_PatientSearchState _value, $Res Function(_$_PatientSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? patientsList = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$_PatientSearchState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PatientSearchStatus,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      patientsList: null == patientsList
          ? _value._patientsList
          : patientsList // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PatientSearchState implements _PatientSearchState {
  const _$_PatientSearchState(
      {required this.status,
      required this.page,
      required final List<Patient> patientsList,
      required this.hasReachedMax})
      : _patientsList = patientsList;

  @override
  final PatientSearchStatus status;
  @override
  final int page;
  final List<Patient> _patientsList;
  @override
  List<Patient> get patientsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientsList);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'PatientSearchState(status: $status, page: $page, patientsList: $patientsList, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientSearchState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality()
                .equals(other._patientsList, _patientsList) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, page,
      const DeepCollectionEquality().hash(_patientsList), hasReachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientSearchStateCopyWith<_$_PatientSearchState> get copyWith =>
      __$$_PatientSearchStateCopyWithImpl<_$_PatientSearchState>(
          this, _$identity);
}

abstract class _PatientSearchState implements PatientSearchState {
  const factory _PatientSearchState(
      {required final PatientSearchStatus status,
      required final int page,
      required final List<Patient> patientsList,
      required final bool hasReachedMax}) = _$_PatientSearchState;

  @override
  PatientSearchStatus get status;
  @override
  int get page;
  @override
  List<Patient> get patientsList;
  @override
  bool get hasReachedMax;
  @override
  @JsonKey(ignore: true)
  _$$_PatientSearchStateCopyWith<_$_PatientSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
