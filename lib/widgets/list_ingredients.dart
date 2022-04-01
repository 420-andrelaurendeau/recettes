import 'package:flutter/material.dart';
import 'package:recettes/models/recette.dart';

class ListIngredientWidget extends StatelessWidget {
  final List<Ingredient> _ingredient;
  const ListIngredientWidget(this._ingredient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print("List Ingrédients contraints $constraints");
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ingrédients",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              height: constraints.maxHeight - 25,
              child: ListView.builder(
                itemCount: _ingredient.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: constraints.maxWidth * .3,
                      child: Text(_ingredient[index].measure),
                    ),
                    title: Text(_ingredient[index].ingredient),
                  );
                  //return Text("Ingredient $index");
                },
              ),
            )
          ],
        );
      },
    );
  }
}
