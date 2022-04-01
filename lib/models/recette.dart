import 'package:flutter/material.dart';

class Ingredient {
  final String ingredient;
  final String measure;

  Ingredient({
    required this.ingredient,
    required this.measure,
  });
}

class Instruction {
  final String instruction;
  final String photoURL;

  Instruction({
    required this.instruction,
    required this.photoURL,
  });
}

// Commentaire

class NoteInvalide implements Exception {}

class Recette with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final int feeds_this_many; // # ppl
  final int preparation_time; // minutes
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final String cover_photo;
  final List<String> keywords;
  final String date_added;
  int? _rating;

  Recette({
    required this.id,
    required this.title,
    required this.description,
    required this.feeds_this_many,
    required this.preparation_time,
    required this.ingredients,
    required this.instructions,
    required this.cover_photo,
    required this.keywords,
    required this.date_added,
  });

  Recette.fromjson(jsonPayload)
      : this.id = jsonPayload['id'].toString(),
        title = jsonPayload['title'],
        description = jsonPayload['description'],
        feeds_this_many = jsonPayload['feeds_this_many'],
        preparation_time = jsonPayload['preparation_time'],
        ingredients = (jsonPayload['ingredients'] as List)
            .map((e) =>
                Ingredient(ingredient: e['ingredient'], measure: e['measure']))
            .toList(),
        instructions = (jsonPayload['instructions'] as List)
            .map((e) => Instruction(
                  instruction: e['instruction'] == null ? '' : e['instruction'],
                  photoURL: e['photo'] == null ? '' : e['photo'],
                ))
            .toList(),
        cover_photo = jsonPayload['cover_photo'] == null
            ? ''
            : jsonPayload['cover_photo'],
        keywords = jsonPayload['keywords'] == null
            ? []
            : jsonPayload['keywords'].cast<String>(),
        date_added =
            jsonPayload['date_added'] == null ? '' : jsonPayload['date_added'];

  void setRating(int rating) {
    if (rating < 0 || rating > 5) throw NoteInvalide();
    _rating = rating;
    print("Rate $title as $rating");
    notifyListeners();
  }

  int get rating {
    return _rating ?? -1;
  }
}
