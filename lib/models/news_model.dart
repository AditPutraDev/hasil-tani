part of 'models.dart';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

class News {
  News({
    this.idNews,
    this.title,
    this.description,
    this.image,
  });

  String? idNews;
  String? title;
  String? description;
  String? image;

  factory News.fromJson(Map<String, dynamic> json) => News(
        idNews: json["id_news"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );
}
