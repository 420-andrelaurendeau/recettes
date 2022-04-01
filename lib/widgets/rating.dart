import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/models/recette.dart';

class Rating extends StatelessWidget {
  Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _recette = Provider.of<Recette>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          _recette.rating < i
              ? IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () => _recette.setRating(i),
                )
              : IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () => _recette.setRating(i),
                )
      ],
    );
  }
}
