part of 'models.dart';

List<Dictionary> dictionaryFromJson(String str) =>
    List<Dictionary>.from(json.decode(str).map((x) => Dictionary.fromJson(x)));

class Dictionary {
  Dictionary({
    this.idDictionary,
    this.istilah,
    this.detail,
    this.type,
  });

  String? idDictionary;
  String? istilah;
  String? detail;
  String? type;

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
        idDictionary: json["id_dictionary"],
        istilah: json["istilah"],
        detail: json["detail"],
        type: json["type"],
      );
}
