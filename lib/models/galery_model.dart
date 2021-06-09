part of 'models.dart';

List<Galery> galeryFromJson(String str) =>
    List<Galery>.from(json.decode(str).map((x) => Galery.fromJson(x)));

class Galery {
  Galery({
    this.idGalery,
    this.name,
    this.foto,
    this.description,
    this.type,
  });

  String? idGalery;
  String? name;
  String? foto;
  String? description;
  String? type;

  factory Galery.fromJson(Map<String, dynamic> json) => Galery(
        idGalery: json["id_galery"],
        name: json["name"],
        foto: json["foto"],
        description: json["description"],
        type: json["type"],
      );
}
