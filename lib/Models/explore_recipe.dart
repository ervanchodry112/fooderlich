part 'ingredient.dart';
part 'instruction.dart';

class RecipeCardType {
  static const String card1 = 'card1';
  static const String card2 = 'card2';
  static const String card3 = 'card3';
}

class ExploreRecipe {
  late String? cardType;
  late String? title;
  late String? subtitle;
  late String? backgroundImage;
  late String? message;
  late String? authorName;
  late String? role;
  late String? profileImage;
  late int? durationInMinutes;
  late String? dietType;
  late int? calories;
  late List<String>? tags;
  late String? description;
  late String? source;
  late List<Ingredients>? ingredients;
  late List<Instruction>? instructions;

  ExploreRecipe(
      {this.cardType,
      this.title,
      this.subtitle,
      this.backgroundImage,
      this.message,
      this.authorName,
      this.role,
      this.profileImage,
      this.durationInMinutes,
      this.dietType,
      this.calories,
      this.tags,
      this.description,
      this.source,
      this.ingredients,
      this.instructions});

  factory ExploreRecipe.fromJson(Map<String, dynamic> json) {
    return ExploreRecipe(
        cardType: json['cardType'],
        title: json['title'],
        subtitle: json['subtitle'],
        backgroundImage: json['backgroundImage'],
        message: json['message'],
        authorName: json['authorName'],
        role: json['role'],
        profileImage: json['profileImage'],
        durationInMinutes: json['durationInMinutes'],
        dietType: json['dietType'],
        calories: json['calories'],
        tags: json['tags'].cast<String>(),
        description: json['description'],
        source: json['source'],
        ingredients: (json['ingredients'] as List)
            .map((e) => Ingredients.fromJson(e))
            .toList(),
        instructions: (json['instructions'] as List)
            .map((e) => Instruction.fromJson(e))
            .toList());
  }
}
