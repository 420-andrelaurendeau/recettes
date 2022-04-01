import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/widgets/details_recette.dart';

import '../models/recettes.dart';

class DetailRecettePage extends StatelessWidget {
  const DetailRecettePage({Key? key}) : super(key: key);

  static const routeName = "details";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final recette_id = arguments['id'];
    final _recettes = Provider.of<Recettes>(context);
    late final _recette_courante;

    // Ne devrait pas arrive sauf lors du development avec une sauvegarde...
    try {
      _recette_courante = _recettes.getRecetteByID(int.parse(recette_id));
    } on NoSuchRecipe {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_recette_courante.title),
      ),
      body: DetailRecetteWidget(_recette_courante),
    );
  }
}
