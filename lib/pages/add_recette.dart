import 'package:flutter/material.dart';

class AjouteModifieRecette extends StatelessWidget {
  const AjouteModifieRecette({Key? key}) : super(key: key);

  static const routeName = "addremove";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout ou modifie"),
      ),
      body: Center(child: Text("TEXTE")),
    );
  }
}
