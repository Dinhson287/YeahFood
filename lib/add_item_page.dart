import 'package:flutter/material.dart';
import 'recipe.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        backgroundColor: Colors.red[200], 
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.red[50], 
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
                Navigator.pop(
                  context,
                  Recipe(
                    name: _nameController.text,
                    ingredients: _ingredientsController.text,
                  ),
                );
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 240, 46, 46), 
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
