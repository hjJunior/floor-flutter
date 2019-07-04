import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_provider/src/view_models/home_view_model.dart';

class Fab extends StatelessWidget {
  Fab({this.listViewController});

  final ScrollController listViewController;

  @override
  Widget build(BuildContext context) => Consumer<HomeViewModel>(
    builder: (_, viewModel, __) => FloatingActionButton(
      onPressed: () => viewModel.addNewPerson(listViewController),
      tooltip: 'Increment',
      backgroundColor: viewModel.isLoading ? Colors.grey : Colors.red,
      child: Icon(viewModel.isLoading ? Icons.cached : Icons.add),
    )
  );
}
