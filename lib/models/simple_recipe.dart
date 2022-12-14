import 'dart:convert';

class SimpleRecipe {
  String id;
  String dishImage;
  String title;
  String duration;
  String source;
  List<String>? information;

  SimpleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    this.information,
  });

  factory SimpleRecipe.fromJson(Map<String, dynamic> json) {
    return SimpleRecipe(
      id: json['id'] as String,
      dishImage: json['dishImage'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = id;
    map['dishImage'] = dishImage;
    map['title'] = title;
    map['duration'] = duration;
    map['source'] = source;
    map['information'] = information.toString();

    return map;
  }

  factory SimpleRecipe.fromMap(Map<String, dynamic> map) {
    return SimpleRecipe(
      id: map['id'] as String,
      dishImage: map['dishImage'] as String,
      title: map['title'] as String,
      duration: map['duration'] as String,
      source: map['source'] as String,
    );
  }
}
