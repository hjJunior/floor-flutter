import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_provider/src/persistence/entity/person.dart';
import 'package:room_provider/src/view_models/home_view_model.dart';

class PersonTile extends StatelessWidget {
  PersonTile(this.person);
  final Person person;

  @override
  Widget build(BuildContext context) => Consumer<HomeViewModel>(
    builder: (_, viewModel, __) => Dismissible(
        key: Key(person.id.toString()),
        background: Container(
          padding: EdgeInsets.all(16),
          color: Colors.red,
          child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: Colors.white, size: 30,)
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => viewModel.removePerson(person),
        child: ListTile(
          title: Text(person.name),
          subtitle: Text(person.id.toString()),
        )
    ),
  );
}
