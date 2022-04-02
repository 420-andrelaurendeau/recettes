import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/widgets/details_recette.dart';

import '../models/recette.dart';
import '../models/recettes.dart';

class DetailRecettePage extends StatelessWidget {
  const DetailRecettePage({Key? key}) : super(key: key);

  static const routeName = "details";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final recette_id = arguments['id'];

    return FutureBuilder(
      future: Recettes.getRecetteByID(int.parse(recette_id)),
      builder: (context, snapshot) {
        print("Connection state is : ${snapshot.connectionState}");
        print("Snapshot Data is ${snapshot.data}");
        print("Snapshot error is ${snapshot.error}");

        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            appBar: AppBar(
              title: Text("chargement"),
            ),
            body: Center(child: CircularProgressIndicator()),
          );

        if (snapshot.hasError)
          return Scaffold(
            appBar: AppBar(
              title: Text("Erreur!"),
            ),
            body: Center(
                child: Text(
              "Malheureusement cette recette ne peut pas etre charge",
              style: TextStyle(color: Colors.red),
            )),
          );

        return Scaffold(
          appBar: AppBar(
            title: Text((snapshot.data as Recette).title),
          ),
          body: DetailRecetteWidget((snapshot.data as Recette)),
        );
      },
    );
  }
}
