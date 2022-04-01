import 'package:flutter/material.dart';
import 'package:recettes/models/recette.dart';

class ListInstructionsWidget extends StatelessWidget {
  final List<Instruction> _ingredient;
  const ListInstructionsWidget(this._ingredient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Instructions",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            height: constraint.maxHeight - 25,
            child: ListView.builder(
              itemCount: _ingredient.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: constraint.maxWidth*.2,
                    child: (_ingredient[index].photoURL == "")?null:Image.network(_ingredient[index].photoUrl)
                    //Text(_ingredient[index].photoURL),
                  ),
                  title: Text(_ingredient[index].instruction),
                );
                //return Text("Ingredient $index");
              },
            ),
          )
        ],
      );
    });
  }
}
