// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimesModel {
  List<Anime> get animes => throw _privateConstructorUsedError;
  bool get isLoadingNewPage => throw _privateConstructorUsedError;
  bool get hasPaginationError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimesModelCopyWith<AnimesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimesModelCopyWith<$Res> {
  factory $AnimesModelCopyWith(
          AnimesModel value, $Res Function(AnimesModel) then) =
      _$AnimesModelCopyWithImpl<$Res, AnimesModel>;
  @useResult
  $Res call(
      {List<Anime> animes, bool isLoadingNewPage, bool hasPaginationError});
}

/// @nodoc
class _$AnimesModelCopyWithImpl<$Res, $Val extends AnimesModel>
    implements $AnimesModelCopyWith<$Res> {
  _$AnimesModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimesModelCopyWith<$Res>
    implements $AnimesModelCopyWith<$Res> {
  factory _$$_AnimesModelCopyWith(
          _$_AnimesModel value, $Res Function(_$_AnimesModel) then) =
      __$$_AnimesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Anime> animes, bool isLoadingNewPage, bool hasPaginationError});
}

/// @nodoc
class __$$_AnimesModelCopyWithImpl<$Res>
    extends _$AnimesModelCopyWithImpl<$Res, _$_AnimesModel>
    implements _$$_AnimesModelCopyWith<$Res> {
  __$$_AnimesModelCopyWithImpl(
      _$_AnimesModel _value, $Res Function(_$_AnimesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animes = null,
    Object? isLoadingNewPage = null,
    Object? hasPaginationError = null,
  }) {
    return _then(_$_AnimesModel(
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
    ));
  }
}

/// @nodoc

class _$_AnimesModel implements _AnimesModel {
  _$_AnimesModel(
      {required final List<Anime> animes,
      this.isLoadingNewPage = false,
      this.hasPaginationError = false})
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
  String toString() {
    return 'AnimesModel(animes: $animes, isLoadingNewPage: $isLoadingNewPage, hasPaginationError: $hasPaginationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimesModel &&
            const DeepCollectionEquality().equals(other._animes, _animes) &&
            (identical(other.isLoadingNewPage, isLoadingNewPage) ||
                other.isLoadingNewPage == isLoadingNewPage) &&
            (identical(other.hasPaginationError, hasPaginationError) ||
                other.hasPaginationError == hasPaginationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_animes),
      isLoadingNewPage,
      hasPaginationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimesModelCopyWith<_$_AnimesModel> get copyWith =>
      __$$_AnimesModelCopyWithImpl<_$_AnimesModel>(this, _$identity);
}

abstract class _AnimesModel implements AnimesModel {
  factory _AnimesModel(
      {required final List<Anime> animes,
      final bool isLoadingNewPage,
      final bool hasPaginationError}) = _$_AnimesModel;

  @override
  List<Anime> get animes;
  @override
  bool get isLoadingNewPage;
  @override
  bool get hasPaginationError;
  @override
  @JsonKey(ignore: true)
  _$$_AnimesModelCopyWith<_$_AnimesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GenresModel {
  List<Genre> get genres => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenresModelCopyWith<GenresModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresModelCopyWith<$Res> {
  factory $GenresModelCopyWith(
          GenresModel value, $Res Function(GenresModel) then) =
      _$GenresModelCopyWithImpl<$Res, GenresModel>;
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenresModelCopyWithImpl<$Res, $Val extends GenresModel>
    implements $GenresModelCopyWith<$Res> {
  _$GenresModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenresModelCopyWith<$Res>
    implements $GenresModelCopyWith<$Res> {
  factory _$$_GenresModelCopyWith(
          _$_GenresModel value, $Res Function(_$_GenresModel) then) =
      __$$_GenresModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class __$$_GenresModelCopyWithImpl<$Res>
    extends _$GenresModelCopyWithImpl<$Res, _$_GenresModel>
    implements _$$_GenresModelCopyWith<$Res> {
  __$$_GenresModelCopyWithImpl(
      _$_GenresModel _value, $Res Function(_$_GenresModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$_GenresModel(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc

class _$_GenresModel implements _GenresModel {
  _$_GenresModel({required final List<Genre> genres}) : _genres = genres;

  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenresModel(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenresModel &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenresModelCopyWith<_$_GenresModel> get copyWith =>
      __$$_GenresModelCopyWithImpl<_$_GenresModel>(this, _$identity);
}

abstract class _GenresModel implements GenresModel {
  factory _GenresModel({required final List<Genre> genres}) = _$_GenresModel;

  @override
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$_GenresModelCopyWith<_$_GenresModel> get copyWith =>
      throw _privateConstructorUsedError;
}
