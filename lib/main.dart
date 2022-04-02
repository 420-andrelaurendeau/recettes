import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/pages/details_recette.dart';

import 'pages/add_recette.dart';
import 'pages/liste_recettes.dart';
import 'models/recettes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Recettes(),
        ),
      ],
      child: MaterialApp(
        title: 'Recettes',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        routes: {
          ListeRecettes.routeName: (context) =>
              const ListeRecettes(title: 'Recette de CAL'),
          AjouteModifieRecette.routeName: (context) => AjouteModifieRecette(),
          DetailRecettePage.routeName: (context) => DetailRecettePage(),
        },
      ),
    );
  }
}



/*
TODO: Clique sur recette va a la page détaillé
Faire la page détailler avec image et ou place holder
Mettre l'action pour modifier la recette

*/
