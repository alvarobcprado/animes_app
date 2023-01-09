// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthModel {
  InputStatus get emailStatus => throw _privateConstructorUsedError;
  InputStatus get nameStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isValidAuth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {InputStatus emailStatus,
      InputStatus nameStatus,
      bool isLoading,
      bool isValidAuth});
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailStatus = null,
    Object? nameStatus = null,
    Object? isLoading = null,
    Object? isValidAuth = null,
  }) {
    return _then(_value.copyWith(
      emailStatus: null == emailStatus
          ? _value.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as InputStatus,
      nameStatus: null == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as InputStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidAuth: null == isValidAuth
          ? _value.isValidAuth
          : isValidAuth // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InputStatus emailStatus,
      InputStatus nameStatus,
      bool isLoading,
      bool isValidAuth});
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$_AuthModel>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailStatus = null,
    Object? nameStatus = null,
    Object? isLoading = null,
    Object? isValidAuth = null,
  }) {
    return _then(_$_AuthModel(
      emailStatus: null == emailStatus
          ? _value.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as InputStatus,
      nameStatus: null == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as InputStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidAuth: null == isValidAuth
          ? _value.isValidAuth
          : isValidAuth // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthModel implements _AuthModel {
  _$_AuthModel(
      {required this.emailStatus,
      required this.nameStatus,
      required this.isLoading,
      required this.isValidAuth});

  @override
  final InputStatus emailStatus;
  @override
  final InputStatus nameStatus;
  @override
  final bool isLoading;
  @override
  final bool isValidAuth;

  @override
  String toString() {
    return 'AuthModel(emailStatus: $emailStatus, nameStatus: $nameStatus, isLoading: $isLoading, isValidAuth: $isValidAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            (identical(other.emailStatus, emailStatus) ||
                other.emailStatus == emailStatus) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isValidAuth, isValidAuth) ||
                other.isValidAuth == isValidAuth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailStatus, nameStatus, isLoading, isValidAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);
}

abstract class _AuthModel implements AuthModel {
  factory _AuthModel(
      {required final InputStatus emailStatus,
      required final InputStatus nameStatus,
      required final bool isLoading,
      required final bool isValidAuth}) = _$_AuthModel;

  @override
  InputStatus get emailStatus;
  @override
  InputStatus get nameStatus;
  @override
  bool get isLoading;
  @override
  bool get isValidAuth;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
