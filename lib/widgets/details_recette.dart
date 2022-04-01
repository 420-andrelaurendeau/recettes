import 'package:flutter/material.dart';
import 'package:recettes/models/recette.dart';
import 'package:recettes/widgets/list_ingredients.dart';
import 'package:recettes/widgets/liste_instructions.dart';

class DetailRecetteWidget extends StatelessWidget {
  final Recette _recette;
  const DetailRecetteWidget(this._recette, {Key? key}) : super(key: key);

  Widget _titleSection(height) {
    // Si il n'y a pas d'image nous utilisont uniquement le titre
    if (_recette.cover_photo == '')
      return Text(
        _recette.title,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 50,
        ),
      );

// Si il y a une image on met le titre dans l'image avec des coins arrondis.
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset(10, 10),
            spreadRadius: 1,
            color: Colors.grey,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(55),
            ),
            child: Image.network(
              _recette.cover_image_url,
              height: height,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: Text(
              _recette.title,
              style: TextStyle(
                backgroundColor: Colors.black38,
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final _title = ;

    return LayoutBuilder(
      // LayoutBuilder Pour avoir l'image pouvant scroller
      // Note: On pourrait utiliser un Sliver mais nous allons conserve une
      // approche plus manuelle
      builder: (context, constraints) {
        print("Contains are $constraints");
        return SingleChildScrollView(
          child: Container(
            height: constraints.maxHeight *
                1.5, // To adjuste to determine image size... Est-ce possible???
            child: Column(
              children: [
                // Image et Titre, max 50%
                _titleSection(constraints.maxHeight * .5),
                // Ingredient
                Container(
                  height: constraints.maxHeight * .4,
                  child: ListIngredientWidget(_recette.ingredients),
                ),
                Container(
                  height: constraints.maxHeight * .6,
                  child: ListInstructionsWidget(
                      _recette.instructions),
                ),
                // Instruction
              ],
            ),
          ),
        );
      },
    );
  }
}
