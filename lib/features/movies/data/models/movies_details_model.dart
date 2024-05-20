import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';

class MovieDetailsModel extends MovieDetailsEntities {
  MovieDetailsModel(
      {super.adult,
      super.backdropPath,
      super.belongsToCollection,
      super.budget,
      super.genres,
      super.homepage,
      super.id,
      super.imdbId,
      super.originCountry,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.productionCompanies,
      super.productionCountries,
      super.releaseDate,
      super.revenue,
      super.runtime,
      super.spokenLanguages,
      super.status,
      super.tagline,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollectionModel.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <GenresModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenresModel.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompaniesModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompaniesModel.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountriesModel.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguagesModel>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguagesModel.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres,
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies,
      'productionCountries': productionCountries,
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages,
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}

class BelongsToCollectionModel extends BelongsToCollection {
  BelongsToCollectionModel(
      {super.id, super.name, super.posterPath, super.backdropPath});

  BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}

class GenresModel extends Genres {
  GenresModel({super.id, super.name});

  GenresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class ProductionCompaniesModel extends ProductionCompanies {
  ProductionCompaniesModel(
      {super.id, super.logoPath, super.name, super.originCountry});

  ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry
    };
  }
}

class ProductionCountriesModel extends ProductionCountries {
  ProductionCountriesModel({super.iso31661, super.name});

  ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'iso_3166_1': iso31661, 'name': name};
  }
}

class SpokenLanguagesModel extends SpokenLanguages {
  SpokenLanguagesModel({super.englishName, super.iso6391, super.name});

  SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }
}
