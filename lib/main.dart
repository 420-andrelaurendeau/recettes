import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/widgets/liste_recettes.dart';

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
        home: const MyHomePage(title: 'Recette de CAL'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Recettes>(
          builder: (context, recettes, child) =>
              Text(widget.title + " : ${recettes.length} recettes"),
        ),
      ),
      body: Center(
        child: ListRecettes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Ajouter un recette',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
