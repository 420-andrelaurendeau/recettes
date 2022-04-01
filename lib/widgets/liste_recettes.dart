import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recettes/widgets/rating.dart';

import '../models/recettes.dart';

class ListRecettes extends StatefulWidget {
  const ListRecettes({Key? key}) : super(key: key);

  @override
  State<ListRecettes> createState() => _ListRecettesState();
}

class _ListRecettesState extends State<ListRecettes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<Recettes>(context, listen: false).loadRecettes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Recettes>(
      builder: (context, recettes, child) {
        return ListView.builder(
          itemCount: recettes.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(recettes.getRecetteByIndex(index).id),
              onDismissed: (direction) => recettes
                  .removeRecetteById(recettes.getRecetteByIndex(index).id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                title: Text(recettes.getRecetteByIndex(index).title),
                trailing: ChangeNotifierProvider.value(
                    value: recettes.getRecetteByIndex(index), child: Rating()),
              ),
            );
          },
        );
      },
    );
  }
}
