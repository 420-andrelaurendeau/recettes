import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/pages/add_recette.dart';

import '../models/recettes.dart';
import '../widgets/liste_recettes.dart';

class ListeRecettes extends StatefulWidget {
  const ListeRecettes({Key? key, required this.title}) : super(key: key);

  static const routeName = "/";

  final String title;

  @override
  State<ListeRecettes> createState() => _ListeRecettesState();
}

class _ListeRecettesState extends State<ListeRecettes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Recettes>(
          builder: (context, recettes, child) =>
              Text(widget.title + " : ${recettes.length} recettes"),
        ),
      ),
      body: const Center(
        child: ListRecettesWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AjouteModifieRecette.routeName),
        tooltip: 'Ajouter une recette',
        child: Icon(Icons.add),
      ),
    );
  }
}
