import 'dart:convert';

// import 'package:floor/floor.dart';

MovieDetailsResponse movieDetailsResponseFromJson(String str) => MovieDetailsResponse.fromJson(json.decode(str));

String movieDetailsResponseToJson(MovieDetailsResponse data) => json.encode(data.toJson());

// @Entity(tableName: 'details', primaryKeys: ['id'])
class MovieDetailsResponse {
    bool? adult;
    String? backdropPath;
    BelongsToCollection? belongsToCollection;
    int? budget;
    List<Genre>? genres;
    String? homepage;
    int? id;
    String? imdbId;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    List<ProductionCompany>? productionCompanies;
    List<ProductionCountry>? productionCountries;
    DateTime? releaseDate;
    int? revenue;
    int? runtime;
    List<SpokenLanguage>? spokenLanguages;
    String? status;
    String? tagline;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;
    Pictures? images;

    MovieDetailsResponse({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.images,
    });

    MovieDetailsResponse copyWith({
        bool? adult,
        String? backdropPath,
        BelongsToCollection? belongsToCollection,
        int? budget,
        List<Genre>? genres,
        String? homepage,
        int? id,
        String? imdbId,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        List<ProductionCompany>? productionCompanies,
        List<ProductionCountry>? productionCountries,
        DateTime? releaseDate,
        int? revenue,
        int? runtime,
        List<SpokenLanguage>? spokenLanguages,
        String? status,
        String? tagline,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
        Pictures? images,
    }) => 
        MovieDetailsResponse(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            belongsToCollection: belongsToCollection ?? this.belongsToCollection,
            budget: budget ?? this.budget,
            genres: genres ?? this.genres,
            homepage: homepage ?? this.homepage,
            id: id ?? this.id,
            imdbId: imdbId ?? this.imdbId,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            productionCompanies: productionCompanies ?? this.productionCompanies,
            productionCountries: productionCountries ?? this.productionCountries,
            releaseDate: releaseDate ?? this.releaseDate,
            revenue: revenue ?? this.revenue,
            runtime: runtime ?? this.runtime,
            spokenLanguages: spokenLanguages ?? this.spokenLanguages,
            status: status ?? this.status,
            tagline: tagline ?? this.tagline,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            images: images ?? this.images,
        );

    factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => MovieDetailsResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"] == null ? null : BelongsToCollection.fromJson(json["belongs_to_collection"]),
        budget: json["budget"],
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"]!.map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"]!.map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        images: json["images"] == null ? null : Pictures.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null ? [] : List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries": productionCountries == null ? [] : List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages == null ? [] : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "images": images?.toJson(),
    };
}

class BelongsToCollection {
    int? id;
    String? name;
    String? posterPath;
    String? backdropPath;

    BelongsToCollection({
        this.id,
        this.name,
        this.posterPath,
        this.backdropPath,
    });

    BelongsToCollection copyWith({
        int? id,
        String? name,
        String? posterPath,
        String? backdropPath,
    }) => 
        BelongsToCollection(
            id: id ?? this.id,
            name: name ?? this.name,
            posterPath: posterPath ?? this.posterPath,
            backdropPath: backdropPath ?? this.backdropPath,
        );

    factory BelongsToCollection.fromJson(Map<String, dynamic> json) => BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}

class Genre {
    int? id;
    String? name;

    Genre({
        this.id,
        this.name,
    });

    Genre copyWith({
        int? id,
        String? name,
    }) => 
        Genre(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Pictures {
    List<Backdrop>? backdrops;
    List<Backdrop>? logos;
    List<Backdrop>? posters;

    Pictures({
        this.backdrops,
        this.logos,
        this.posters,
    });

    Pictures copyWith({
        List<Backdrop>? backdrops,
        List<Backdrop>? logos,
        List<Backdrop>? posters,
    }) => 
        Pictures(
            backdrops: backdrops ?? this.backdrops,
            logos: logos ?? this.logos,
            posters: posters ?? this.posters,
        );

    factory Pictures.fromJson(Map<String, dynamic> json) => Pictures(
        backdrops: json["backdrops"] == null ? [] : List<Backdrop>.from(json["backdrops"]!.map((x) => Backdrop.fromJson(x))),
        logos: json["logos"] == null ? [] : List<Backdrop>.from(json["logos"]!.map((x) => Backdrop.fromJson(x))),
        posters: json["posters"] == null ? [] : List<Backdrop>.from(json["posters"]!.map((x) => Backdrop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "backdrops": backdrops == null ? [] : List<dynamic>.from(backdrops!.map((x) => x.toJson())),
        "logos": logos == null ? [] : List<dynamic>.from(logos!.map((x) => x.toJson())),
        "posters": posters == null ? [] : List<dynamic>.from(posters!.map((x) => x.toJson())),
    };
}

class Backdrop {
    double? aspectRatio;
    int? height;
    String? iso6391;
    String? filePath;
    double? voteAverage;
    int? voteCount;
    int? width;

    Backdrop({
        this.aspectRatio,
        this.height,
        this.iso6391,
        this.filePath,
        this.voteAverage,
        this.voteCount,
        this.width,
    });

    Backdrop copyWith({
        double? aspectRatio,
        int? height,
        String? iso6391,
        String? filePath,
        double? voteAverage,
        int? voteCount,
        int? width,
    }) => 
        Backdrop(
            aspectRatio: aspectRatio ?? this.aspectRatio,
            height: height ?? this.height,
            iso6391: iso6391 ?? this.iso6391,
            filePath: filePath ?? this.filePath,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            width: width ?? this.width,
        );

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };
}

class ProductionCompany {
    int? id;
    String? logoPath;
    String? name;
    String? originCountry;

    ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    ProductionCompany copyWith({
        int? id,
        String? logoPath,
        String? name,
        String? originCountry,
    }) => 
        ProductionCompany(
            id: id ?? this.id,
            logoPath: logoPath ?? this.logoPath,
            name: name ?? this.name,
            originCountry: originCountry ?? this.originCountry,
        );

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    String? iso31661;
    String? name;

    ProductionCountry({
        this.iso31661,
        this.name,
    });

    ProductionCountry copyWith({
        String? iso31661,
        String? name,
    }) => 
        ProductionCountry(
            iso31661: iso31661 ?? this.iso31661,
            name: name ?? this.name,
        );

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    String? englishName;
    String? iso6391;
    String? name;

    SpokenLanguage({
        this.englishName,
        this.iso6391,
        this.name,
    });

    SpokenLanguage copyWith({
        String? englishName,
        String? iso6391,
        String? name,
    }) => 
        SpokenLanguage(
            englishName: englishName ?? this.englishName,
            iso6391: iso6391 ?? this.iso6391,
            name: name ?? this.name,
        );

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
