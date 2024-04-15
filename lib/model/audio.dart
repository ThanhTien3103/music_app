import 'dart:convert';

ListAudio listAudioFromJson(String str) => ListAudio.fromJson(json.decode(str));

String listAudioToJson(ListAudio data) => json.encode(data.toJson());

class ListAudio {
  List<Audio>? data;
  int? total;

  ListAudio({
    this.data,
    this.total,
  });

  factory ListAudio.fromJson(Map<String, dynamic> json) => ListAudio(
    data: List<Audio>.from(json["data"].map((x) => Audio.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };
}

class Audio {
  int? id;
  String? title;
  String? titleShort;
  String? preview;
  String? md5Image;

  Audio({
    this.id,
    this.title,
    this.titleShort,
    this.preview,
    this.md5Image,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    id: json["id"],
    title: json["title"],
    titleShort: json["title_short"],
    preview: json["preview"],
    md5Image: json["md5_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "title_short": titleShort,
    "preview": preview,
    "md5_image": md5Image,
  };
}
