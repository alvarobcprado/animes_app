// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_list_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimeListModel {
  List<Anime> get animes => throw _privateConstructorUsedError;
  bool get isLoadingNewPage => throw _privateConstructorUsedError;
  bool get hasPaginationError => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeListModelCopyWith<AnimeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeListModelCopyWith<$Res> {
  factory $AnimeListModelCopyWith(
          AnimeListModel value, $Res Function(AnimeListModel) then) =
      _$AnimeListModelCopyWithImpl<$Res, AnimeListModel>;
  @useResult
  $Res call(
      {List<Anime> animes,
      bool isLoadingNewPage,
      bool hasPaginationError,
      Exception? error});
}

/// @nodoc
class _$AnimeListModelCopyWithImpl<$Res, $Val extends AnimeListModel>
    implements $AnimeListModelCopyWith<$Res> {
  _$AnimeListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animes = null,
    Object? isLoadingNewPage = null,
    Object? hasPaginationError = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      animes: null == animes
          ? _value.animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<Anime>,
      isLoadingNewPage: null == isLoadingNewPage
          ? _value.isLoadingNewPage
          : isLoadingNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaginationError: null == hasPaginationError
          ? _value.hasPaginationError
          : hasPaginationError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeListModelCopyWith<$Res>
    implements $AnimeListModelCopyWith<$Res> {
  factory _$$_AnimeListModelCopyWith(
          _$_AnimeListModel value, $Res Function(_$_AnimeListModel) then) =
      __$$_AnimeListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Anime> animes,
      bool isLoadingNewPage,
      bool hasPaginationError,
      Exception? error});
}

/// @nodoc
class __$$_AnimeListModelCopyWithImpl<$Res>
    extends _$AnimeListModelCopyWithImpl<$Res, _$_AnimeListModel>
    implements _$$_AnimeListModelCopyWith<$Res> {
  __$$_AnimeListModelCopyWithImpl(
      _$_AnimeListModel _value, $Res Function(_$_AnimeListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animes = null,
    Object? isLoadingNewPage = null,
    Object? hasPaginationError = null,
    Object? error = freezed,
  }) {
    return _then(_$_AnimeListModel(
      animes: null == animes
          ? _value._animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<Anime>,
      isLoadingNewPage: null == isLoadingNewPage
          ? _value.isLoadingNewPage
          : isLoadingNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaginationError: null == hasPaginationError
          ? _value.hasPaginationError
          : hasPaginationError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_AnimeListModel implements _AnimeListModel {
  _$_AnimeListModel(
      {required final List<Anime> animes,
      this.isLoadingNewPage = false,
      this.hasPaginationError = false,
      this.error})
      : _animes = animes;

  final List<Anime> _animes;
  @override
  List<Anime> get animes {
    if (_animes is EqualUnmodifiableListView) return _animes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animes);
  }

  @override
  @JsonKey()
  final bool isLoadingNewPage;
  @override
  @JsonKey()
  final bool hasPaginationError;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'AnimeListModel(animes: $animes, isLoadingNewPage: $isLoadingNewPage, hasPaginationError: $hasPaginationError, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeListModel &&
            const DeepCollectionEquality().equals(other._animes, _animes) &&
            (identical(other.isLoadingNewPage, isLoadingNewPage) ||
                other.isLoadingNewPage == isLoadingNewPage) &&
            (identical(other.hasPaginationError, hasPaginationError) ||
                other.hasPaginationError == hasPaginationError) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_animes),
      isLoadingNewPage,
      hasPaginationError,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeListModelCopyWith<_$_AnimeListModel> get copyWith =>
      __$$_AnimeListModelCopyWithImpl<_$_AnimeListModel>(this, _$identity);
}

abstract class _AnimeListModel implements AnimeListModel {
  factory _AnimeListModel(
      {required final List<Anime> animes,
      final bool isLoadingNewPage,
      final bool hasPaginationError,
      final Exception? error}) = _$_AnimeListModel;

  @override
  List<Anime> get animes;
  @override
  bool get isLoadingNewPage;
  @override
  bool get hasPaginationError;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeListModelCopyWith<_$_AnimeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
