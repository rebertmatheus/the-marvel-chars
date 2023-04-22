import 'thumbnail.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;

  Character({this.id, this.name, this.description, this.modified, this.thumbnail});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}
