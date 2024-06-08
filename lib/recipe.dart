class Recipe {
  String name;
  String ingredients;

  Recipe({required this.name, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      ingredients: json['ingredients'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'ingredients': ingredients,
      };
}
