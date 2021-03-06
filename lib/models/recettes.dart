import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './recette.dart';

class NoSuchRecipe implements Exception {}

class Recettes with ChangeNotifier {
  final List<Recette> _recetteList = [];
  final url = Uri.parse('https://cegep.fdtt.space/v1/recipes.json');

  loadRecettes() async {
    print("Will be loading recettes");
    _recetteList.clear();

    try {
      var response = await http.get(url);
      // Process the response
      var jsonPayload = json.decode(utf8.decode(response.bodyBytes));

      for (num i = 0; i < jsonPayload['data'].length; i++) {
        _recetteList.add(Recette.fromjson(jsonPayload['data'][i]));
      }
    } on Exception catch (e) {
      print("Got error $e");
    }

    print("Recettes loaded ${this.length}");
    afficheTitres();
    notifyListeners();
  }

  afficheTitres() {
    // Afficher tous les recettes
    print("Il y a ${_recetteList.length} recettes");
    _recetteList.forEach((element) => print("${element.id}:${element.title}"));
  }

  static Future<Recette> getRecetteByID(int id) async {
    // Retourne la recette avec le ID
    // Si il n'y a pas de recette avec cet ID retourner un exception NoSuchRecipe
    final url = Uri.parse('https://cegep.fdtt.space/v1/recipes/$id.json');

    var response = await http.get(url, headers: {
      "debugme": "true",
    });
    // Process the response
    var jsonPayload = json.decode(utf8.decode(response.bodyBytes));

    // Ici on devrait verfier les erreurs.
    return Recette.fromjson(jsonPayload["data"]);
  }

  void removeRecetteById(String id) {
    _recetteList.removeWhere((element) => element.id == id);
  }

  Recette getRecetteByIndex(int index) {
    return _recetteList[index];
  }

  int get length {
    return _recetteList.length;
  }
}
