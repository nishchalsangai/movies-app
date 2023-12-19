import 'dart:convert';

VideoDetailsResponse videoDetailsResponseFromJson(String str) => VideoDetailsResponse.fromJson(json.decode(str));

String videoDetailsResponseToJson(VideoDetailsResponse data) => json.encode(data.toJson());

class VideoDetailsResponse {
    int? id;
    List<VideoModel>? results;

    VideoDetailsResponse({
        this.id,
        this.results,
    });

    VideoDetailsResponse copyWith({
        int? id,
        List<VideoModel>? results,
    }) => 
        VideoDetailsResponse(
            id: id ?? this.id,
            results: results ?? this.results,
        );

    factory VideoDetailsResponse.fromJson(Map<String, dynamic> json) => VideoDetailsResponse(
        id: json["id"],
        results: json["results"] == null ? [] : List<VideoModel>.from(json["results"]!.map((x) => VideoModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class VideoModel {
    String? iso6391;
    String? iso31661;
    String? name;
    String? key;
    String? site;
    int? size;
    String? type;
    bool? official;
    DateTime? publishedAt;
    String? id;

    VideoModel({
        this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id,
    });

    VideoModel copyWith({
        String? iso6391,
        String? iso31661,
        String? name,
        String? key,
        String? site,
        int? size,
        String? type,
        bool? official,
        DateTime? publishedAt,
        String? id,
    }) => 
        VideoModel(
            iso6391: iso6391 ?? this.iso6391,
            iso31661: iso31661 ?? this.iso31661,
            name: name ?? this.name,
            key: key ?? this.key,
            site: site ?? this.site,
            size: size ?? this.size,
            type: type ?? this.type,
            official: official ?? this.official,
            publishedAt: publishedAt ?? this.publishedAt,
            id: id ?? this.id,
        );

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt?.toIso8601String(),
        "id": id,
    };
}
