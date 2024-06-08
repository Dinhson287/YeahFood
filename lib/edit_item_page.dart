import 'package:flutter/material.dart';
import 'recipe.dart';

class EditItemPage extends StatefulWidget {
  final Recipe recipe;

  EditItemPage({required this.recipe});

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  late TextEditingController _nameController;
  late TextEditingController _ingredientsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.recipe.name);
    _ingredientsController = TextEditingController(text: widget.recipe.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        backgroundColor: Colors.red[200], // Tông màu đỏ nhạt cho AppBar
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.red[50], // Màu nền đỏ nhạt cho body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(
                labelText: 'Ingredients',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Recipe updatedRecipe = Recipe(
                  name: _nameController.text,
                  ingredients: _ingredientsController.text,
                );
                Navigator.pop(context, updatedRecipe);
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[200], // Tông màu đỏ nhạt cho nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
