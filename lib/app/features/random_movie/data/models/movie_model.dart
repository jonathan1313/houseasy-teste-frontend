import 'dart:convert';
import 'package:houseasy_teste_frontend/app/core/configs/api_tmdb_constants.dart';
import 'package:intl/intl.dart';

class Movies {
  int? page;
  late final List<Movie> listMovies;
  int? totalResults;
  int? totalPages;

  Movies(
      {this.page,
      required this.listMovies,
      this.totalResults,
      this.totalPages});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    listMovies =
        List.from(json['results']).map((e) => Movie.fromMap(e)).toList();
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = listMovies.map((v) => v.toJson()).toList();
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }
}

class Movie {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  num? popularity;
  int? voteCount;
  bool? video;
  num? voteAverage;

  Movie(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'poster_path': posterPath,
      'adult': adult,
      'overview': overview,
      'release_date': releaseDate,
      'genre_ids': genreIds,
      'id': id,
      'original_title': originalTitle,
      'original_language': originalLanguage,
      'title': title,
      'backdrop_path': backdropPath,
      'popularity': popularity,
      'vote_count': voteCount,
      'video': video,
      'vote_average': voteAverage,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      posterPath: map['poster_path'] != null ? map['poster_path'] as String : null,
      adult: map['adult'] != null ? map['adult'] as bool : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      releaseDate: map['release_date'] != null ? map['release_date'] as String : null,
      genreIds: map['genre_ids'] != null ? List.from((map['genre_ids'] as List)) : null,
      id: map['id'] != null ? map['id'] as int : null,
      originalTitle: map['original_title'] != null ? map['original_title'] as String : null,
      originalLanguage: map['original_language'] != null ? map['original_language'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      backdropPath: map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      popularity: map['popularity'] != null ? map['popularity'] as num : null,
      voteCount: map['vote_count'] != null ? map['vote_count'] as int : null,
      video: map['video'] != null ? map['video'] as bool : null,
      voteAverage: map['vote_average'] != null ? map['vote_average'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(posterPath: $posterPath, adult: $adult, overview: $overview, releaseDate: $releaseDate, genreIds: $genreIds, id: $id, originalTitle: $originalTitle, originalLanguage: $originalLanguage, title: $title, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, voteAverage: $voteAverage)';
  }

  String getReleaseYear () {
    final DateTime release = DateTime.parse(releaseDate ?? '0000-00-00');
    final releaseYear = DateFormat('yyyy').format(release);
    return releaseYear;
  }

  String getPostImage() {
    final String postUrl = posterPath!.contains('image-not-found') ? posterPath! : ApiTmdbConstants.requestImg(posterPath!);
    return postUrl;
  }
}
