import 'package:movie_database_app/util/model/genres.dart';
import 'package:movie_database_app/util/model/production_company.dart';

class MovieModel {
  bool adult;
  String backdrop_path;
  double budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdb_id;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  List<ProductionCompany> production_companies;
  String release_date;
  double revenue;
  double runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double vote_average;
  double vote_count;

  MovieModel({
    this.adult,
    this.backdrop_path,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdb_id,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.production_companies,
    this.release_date,
    this.revenue,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });

  static MovieModel paserMovie(map) {
    return MovieModel.fromJson(map);
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      adult: json["adult"] ?? '',
      backdrop_path: json["backdrop_path"] ?? '',
      budget: double.tryParse(json["budget"].toString()) ?? 0,
      genres: Genres.parserGenresList(json),
      homepage: json["homepage"] ?? '',
      id: int.tryParse(json["id"].toString()) ?? 0,
      imdb_id: json["imdb_id"] ?? '',
      original_title: json["original_title"] ?? '',
      overview: json["overview"] ?? '',
      popularity: double.tryParse(json["popularity"].toString()) ?? 0,
      poster_path: json["poster_path"] ?? '',
      production_companies: ProductionCompany.paserProductionCompany(json),
      release_date: json["release_date"] ?? '',
      revenue: double.tryParse(json["revenue"].toString()) ?? 0,
      status: json["status"] ?? '',
      tagline: json["tagline"] ?? '',
      title: json["title"] ?? '',
      video: json["video"] ?? false,
      vote_average: double.tryParse(json["vote_average"].toString()) ?? 0,
      vote_count: double.tryParse(json["vote_count"].toString()) ?? 0);

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdrop_path,
        "budget": budget,
        "genres": genres,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdb_id,
        "original_title": original_title,
        "overview": overview,
        "popularity": popularity,
        "poster_path": poster_path,
        "production_companies": production_companies,
        "release_date": release_date,
        "revenue": revenue,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": vote_average,
        "vote_count": vote_count,
      };
}
