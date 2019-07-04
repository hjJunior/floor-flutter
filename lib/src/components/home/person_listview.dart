import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_provider/src/components/home/person_tile.dart';
import 'package:room_provider/src/persistence/entity/person.dart';
import 'package:room_provider/src/view_models/home_view_model.dart';

class PersonListView extends StatelessWidget {
  PersonListView({this.listViewController});

  final ScrollController listViewController;

  @override
  Widget build(BuildContext context) => Consumer<HomeViewModel>(
    builder: (_, viewModel, __) => StreamBuilder<List<Person>>(
      stream: viewModel.persons,
      initialData: [],
      builder: (_, snap) {
        if (!snap.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          controller: listViewController,
          itemCount: snap.data?.length ?? 0,
          itemBuilder: (_, index) => PersonTile(snap.data[index])
        );
      }
    ),
  );
}
