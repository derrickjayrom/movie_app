// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) {
  return _MovieResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieResponse {
  int get page => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  /// Serializes this MovieResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieResponseCopyWith<MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseCopyWith<$Res> {
  factory $MovieResponseCopyWith(
    MovieResponse value,
    $Res Function(MovieResponse) then,
  ) = _$MovieResponseCopyWithImpl<$Res, MovieResponse>;
  @useResult
  $Res call({
    int page,
    List<Movie> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  });
}

/// @nodoc
class _$MovieResponseCopyWithImpl<$Res, $Val extends MovieResponse>
    implements $MovieResponseCopyWith<$Res> {
  _$MovieResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<Movie>,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalResults: null == totalResults
                ? _value.totalResults
                : totalResults // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieResponseImplCopyWith<$Res>
    implements $MovieResponseCopyWith<$Res> {
  factory _$$MovieResponseImplCopyWith(
    _$MovieResponseImpl value,
    $Res Function(_$MovieResponseImpl) then,
  ) = __$$MovieResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    List<Movie> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  });
}

/// @nodoc
class __$$MovieResponseImplCopyWithImpl<$Res>
    extends _$MovieResponseCopyWithImpl<$Res, _$MovieResponseImpl>
    implements _$$MovieResponseImplCopyWith<$Res> {
  __$$MovieResponseImplCopyWithImpl(
    _$MovieResponseImpl _value,
    $Res Function(_$MovieResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(
      _$MovieResponseImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<Movie>,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalResults: null == totalResults
            ? _value.totalResults
            : totalResults // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieResponseImpl implements _MovieResponse {
  const _$MovieResponseImpl({
    required this.page,
    required final List<Movie> results,
    @JsonKey(name: 'total_pages') required this.totalPages,
    @JsonKey(name: 'total_results') required this.totalResults,
  }) : _results = results;

  factory _$MovieResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieResponseImplFromJson(json);

  @override
  final int page;
  final List<Movie> _results;
  @override
  List<Movie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'MovieResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    const DeepCollectionEquality().hash(_results),
    totalPages,
    totalResults,
  );

  /// Create a copy of MovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieResponseImplCopyWith<_$MovieResponseImpl> get copyWith =>
      __$$MovieResponseImplCopyWithImpl<_$MovieResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieResponseImplToJson(this);
  }
}

abstract class _MovieResponse implements MovieResponse {
  const factory _MovieResponse({
    required final int page,
    required final List<Movie> results,
    @JsonKey(name: 'total_pages') required final int totalPages,
    @JsonKey(name: 'total_results') required final int totalResults,
  }) = _$MovieResponseImpl;

  factory _MovieResponse.fromJson(Map<String, dynamic> json) =
      _$MovieResponseImpl.fromJson;

  @override
  int get page;
  @override
  List<Movie> get results;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;

  /// Create a copy of MovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieResponseImplCopyWith<_$MovieResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call({
    bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    int id,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_title') String originalTitle,
    String overview,
    double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String title,
    bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  });
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = null,
    Object? id = null,
    Object? mediaType = freezed,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(
      _value.copyWith(
            adult: null == adult
                ? _value.adult
                : adult // ignore: cast_nullable_to_non_nullable
                      as bool,
            backdropPath: freezed == backdropPath
                ? _value.backdropPath
                : backdropPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            genreIds: null == genreIds
                ? _value.genreIds
                : genreIds // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            mediaType: freezed == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalLanguage: null == originalLanguage
                ? _value.originalLanguage
                : originalLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            originalTitle: null == originalTitle
                ? _value.originalTitle
                : originalTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            overview: null == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String,
            popularity: null == popularity
                ? _value.popularity
                : popularity // ignore: cast_nullable_to_non_nullable
                      as double,
            posterPath: freezed == posterPath
                ? _value.posterPath
                : posterPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            releaseDate: freezed == releaseDate
                ? _value.releaseDate
                : releaseDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            video: null == video
                ? _value.video
                : video // ignore: cast_nullable_to_non_nullable
                      as bool,
            voteAverage: null == voteAverage
                ? _value.voteAverage
                : voteAverage // ignore: cast_nullable_to_non_nullable
                      as double,
            voteCount: null == voteCount
                ? _value.voteCount
                : voteCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
    _$MovieImpl value,
    $Res Function(_$MovieImpl) then,
  ) = __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    int id,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_title') String originalTitle,
    String overview,
    double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String title,
    bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  });
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
    _$MovieImpl _value,
    $Res Function(_$MovieImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = null,
    Object? id = null,
    Object? mediaType = freezed,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(
      _$MovieImpl(
        adult: null == adult
            ? _value.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        backdropPath: freezed == backdropPath
            ? _value.backdropPath
            : backdropPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        genreIds: null == genreIds
            ? _value._genreIds
            : genreIds // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        mediaType: freezed == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalLanguage: null == originalLanguage
            ? _value.originalLanguage
            : originalLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        originalTitle: null == originalTitle
            ? _value.originalTitle
            : originalTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        overview: null == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String,
        popularity: null == popularity
            ? _value.popularity
            : popularity // ignore: cast_nullable_to_non_nullable
                  as double,
        posterPath: freezed == posterPath
            ? _value.posterPath
            : posterPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        releaseDate: freezed == releaseDate
            ? _value.releaseDate
            : releaseDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        video: null == video
            ? _value.video
            : video // ignore: cast_nullable_to_non_nullable
                  as bool,
        voteAverage: null == voteAverage
            ? _value.voteAverage
            : voteAverage // ignore: cast_nullable_to_non_nullable
                  as double,
        voteCount: null == voteCount
            ? _value.voteCount
            : voteCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl({
    required this.adult,
    @JsonKey(name: 'backdrop_path') this.backdropPath,
    @JsonKey(name: 'genre_ids') required final List<int> genreIds,
    required this.id,
    @JsonKey(name: 'media_type') this.mediaType,
    @JsonKey(name: 'original_language') required this.originalLanguage,
    @JsonKey(name: 'original_title') required this.originalTitle,
    required this.overview,
    required this.popularity,
    @JsonKey(name: 'poster_path') this.posterPath,
    @JsonKey(name: 'release_date') this.releaseDate,
    required this.title,
    required this.video,
    @JsonKey(name: 'vote_average') required this.voteAverage,
    @JsonKey(name: 'vote_count') required this.voteCount,
  }) : _genreIds = genreIds;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<int> _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  final int id;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  final String title;
  @override
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'Movie(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    adult,
    backdropPath,
    const DeepCollectionEquality().hash(_genreIds),
    id,
    mediaType,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  );

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(this);
  }
}

abstract class _Movie implements Movie {
  const factory _Movie({
    required final bool adult,
    @JsonKey(name: 'backdrop_path') final String? backdropPath,
    @JsonKey(name: 'genre_ids') required final List<int> genreIds,
    required final int id,
    @JsonKey(name: 'media_type') final String? mediaType,
    @JsonKey(name: 'original_language') required final String originalLanguage,
    @JsonKey(name: 'original_title') required final String originalTitle,
    required final String overview,
    required final double popularity,
    @JsonKey(name: 'poster_path') final String? posterPath,
    @JsonKey(name: 'release_date') final String? releaseDate,
    required final String title,
    required final bool video,
    @JsonKey(name: 'vote_average') required final double voteAverage,
    @JsonKey(name: 'vote_count') required final int voteCount,
  }) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  int get id;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  String get title;
  @override
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return _GenreResponse.fromJson(json);
}

/// @nodoc
mixin _$GenreResponse {
  List<Genre> get genres => throw _privateConstructorUsedError;

  /// Serializes this GenreResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenreResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenreResponseCopyWith<GenreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreResponseCopyWith<$Res> {
  factory $GenreResponseCopyWith(
    GenreResponse value,
    $Res Function(GenreResponse) then,
  ) = _$GenreResponseCopyWithImpl<$Res, GenreResponse>;
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenreResponseCopyWithImpl<$Res, $Val extends GenreResponse>
    implements $GenreResponseCopyWith<$Res> {
  _$GenreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenreResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? genres = null}) {
    return _then(
      _value.copyWith(
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<Genre>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenreResponseImplCopyWith<$Res>
    implements $GenreResponseCopyWith<$Res> {
  factory _$$GenreResponseImplCopyWith(
    _$GenreResponseImpl value,
    $Res Function(_$GenreResponseImpl) then,
  ) = __$$GenreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class __$$GenreResponseImplCopyWithImpl<$Res>
    extends _$GenreResponseCopyWithImpl<$Res, _$GenreResponseImpl>
    implements _$$GenreResponseImplCopyWith<$Res> {
  __$$GenreResponseImplCopyWithImpl(
    _$GenreResponseImpl _value,
    $Res Function(_$GenreResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenreResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? genres = null}) {
    return _then(
      _$GenreResponseImpl(
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<Genre>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreResponseImpl implements _GenreResponse {
  const _$GenreResponseImpl({required final List<Genre> genres})
    : _genres = genres;

  factory _$GenreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreResponseImplFromJson(json);

  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenreResponse(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreResponseImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  /// Create a copy of GenreResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      __$$GenreResponseImplCopyWithImpl<_$GenreResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreResponseImplToJson(this);
  }
}

abstract class _GenreResponse implements GenreResponse {
  const factory _GenreResponse({required final List<Genre> genres}) =
      _$GenreResponseImpl;

  factory _GenreResponse.fromJson(Map<String, dynamic> json) =
      _$GenreResponseImpl.fromJson;

  @override
  List<Genre> get genres;

  /// Create a copy of GenreResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Genre to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenreImplCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$GenreImplCopyWith(
    _$GenreImpl value,
    $Res Function(_$GenreImpl) then,
  ) = __$$GenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$GenreImplCopyWithImpl<$Res>
    extends _$GenreCopyWithImpl<$Res, _$GenreImpl>
    implements _$$GenreImplCopyWith<$Res> {
  __$$GenreImplCopyWithImpl(
    _$GenreImpl _value,
    $Res Function(_$GenreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$GenreImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreImpl implements _Genre {
  const _$GenreImpl({required this.id, required this.name});

  factory _$GenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      __$$GenreImplCopyWithImpl<_$GenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreImplToJson(this);
  }
}

abstract class _Genre implements Genre {
  const factory _Genre({required final int id, required final String name}) =
      _$GenreImpl;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$GenreImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
