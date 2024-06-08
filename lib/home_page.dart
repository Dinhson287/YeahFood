import 'package:flutter/material.dart';
import 'recipe.dart';
import 'add_item_page.dart';
import 'edit_item_page.dart';
import 'recipe_service.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  _loadRecipes() async {
    _recipes = await RecipeService.getRecipes();
    setState(() {});
  }

  _saveRecipes() async {
    await RecipeService.saveRecipes(_recipes);
  }

  _addRecipe(Recipe recipe) {
    setState(() {
      _recipes.add(recipe);
    });
    _saveRecipes();
  }

  _editRecipe(int index, Recipe recipe) {
    setState(() {
      _recipes[index] = recipe;
    });
    _saveRecipes();
  }

  _deleteRecipe(int index) {
    setState(() {
      _recipes.removeAt(index);
    });
    _saveRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
        backgroundColor: Colors.red[200], // Tông màu đỏ nhạt cho AppBar
      ),
      body: Container(
        color: Colors.red[50], // Màu nền đỏ nhạt cho body
        child: ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Điều chỉnh vị trí đổ bóng
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    _recipes[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Text(
                    _recipes[index].ingredients,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditItemPage(recipe: _recipes[index]),
                      ),
                    ).then((updatedRecipe) {
                      if (updatedRecipe != null) {
                        _editRecipe(index, updatedRecipe as Recipe);
                      }
                    });
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteRecipe(index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          ).then((newRecipe) {
            if (newRecipe != null) {
              _addRecipe(newRecipe as Recipe);
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 245, 53, 53), // Tông màu đỏ nhạt cho FloatingActionButton
      ),
    );
  }
}
