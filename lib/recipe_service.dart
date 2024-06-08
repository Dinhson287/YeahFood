import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'recipe.dart';

class RecipeService {
  static const String _keyRecipes = 'recipes';

  static Future<List<Recipe>> getRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? recipesJson = prefs.getStringList(_keyRecipes);
    if (recipesJson != null) {
      return recipesJson.map((json) => Recipe.fromJson(jsonDecode(json))).toList();
    }
    return [];
  }

  static Future<void> saveRecipes(List<Recipe> recipes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recipesJson =
        recipes.map((recipe) => jsonEncode(recipe.toJson())).toList();
    await prefs.setStringList(_keyRecipes, recipesJson);
  }
}
