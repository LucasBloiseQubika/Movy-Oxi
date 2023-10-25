class HomeResponse {
  String? createdBy;
  String? description;
  int? favoriteCount;
  int? id;
  List<Items>? items;
  int? itemCount;
  String? iso6391;
  String? name;
  String? posterPath;

  HomeResponse(
      {this.createdBy,
      this.description,
      this.favoriteCount,
      this.id,
      this.items,
      this.itemCount,
      this.iso6391,
      this.name,
      this.posterPath});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    description = json['description'];
    favoriteCount = json['favorite_count'];
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    itemCount = json['item_count'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_by'] = createdBy;
    data['description'] = description;
    data['favorite_count'] = favoriteCount;
    data['id'] = id;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['item_count'] = itemCount;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    data['poster_path'] = posterPath;
    return data;
  }
}

class Items {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Items(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});

  Items.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
