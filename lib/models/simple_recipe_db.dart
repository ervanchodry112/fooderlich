import 'package:fooderlich/models/models.dart';

class SimpleRecipeDB {
  String? id;
  String? dishImage;
  String? title;
  String? duration;
  String? source;
  List<String>? information;

  SimpleRecipeDB({
    this.id,
    this.dishImage,
    this.title,
    this.duration,
    this.source,
    this.information,
  });

  factory SimpleRecipeDB.fromJson(Map<String, dynamic> json) {
    return SimpleRecipeDB(
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

  SimpleRecipeDB.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.dishImage = map['dishImage'];
    this.title = map['title'];
    this.duration = map['duration'];
    this.source = map['source'];
    this.information = map['information'];
  }
}
