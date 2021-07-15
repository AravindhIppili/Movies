import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.id,
    required this.director,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.voted,
    required this.pageViews,
    required this.description,
    required this.poster,
    required this.totalVoted,
    required this.voting,
  });

  String id;
  List<String> director;
  List<String> stars;
  int releasedDate;
  List<String> productionCompany;
  String title;
  String language;
  dynamic runTime;
  String genre;
  List<Voted> voted;
  int pageViews;
  String description;
  String poster;
  int totalVoted;
  int voting;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        director: List<String>.from(json["director"].map((x) => x)),
        stars: List<String>.from(json["stars"].map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany:
            List<String>.from(json["productionCompany"].map((x) => x)),
        title: json["title"],
        language: json["language"],
        runTime: json["runTime"],
        genre: json["genre"],
        voted: List<Voted>.from(json["voted"].map((x) => Voted.fromJson(x))),
        pageViews: json["pageViews"],
        description: json["description"],
        poster: json["poster"],
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director": List<dynamic>.from(director.map((x) => x)),
        "stars": List<dynamic>.from(stars.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany":
            List<dynamic>.from(productionCompany.map((x) => x)),
        "title": title,
        "language": language,
        "runTime": runTime,
        "genre": genre,
        "voted": List<dynamic>.from(voted.map((x) => x.toJson())),
        "pageViews": pageViews,
        "description": description,
        "poster": poster,
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

class Voted {
  Voted({
    required this.id,
    required this.updatedAt,
    required this.genre,
  });

  String id;
  int updatedAt;
  String genre;

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}
