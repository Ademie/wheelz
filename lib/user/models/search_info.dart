// To parse this JSON data, do
//
//     final searchInfo = searchInfoFromJson(jsonString);

import 'dart:convert';

List<SearchInfo> searchInfoFromJson(String str) => List<SearchInfo>.from(json.decode(str).map((x) => SearchInfo.fromJson(x)));

String searchInfoToJson(List<SearchInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchInfo {
    String? type;
    Geometry? geometry;
    Properties? properties;

    SearchInfo({
        this.type,
        this.geometry,
        this.properties,
    });

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        type: json["type"],
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "geometry": geometry?.toJson(),
        "properties": properties?.toJson(),
    };
}

class Geometry {
    List<double>? coordinates;
    String? type;

    Geometry({
        this.coordinates,
        this.type,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
    };
}

class Properties {
    String? city;
    String? country;
    String? name;
    String? postcode;

    Properties({
        this.city,
        this.country,
        this.name,
        this.postcode,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        city: json["city"],
        country: json["country"],
        name: json["name"],
        postcode: json["postcode"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "name": name,
        "postcode": postcode,
    };
}
