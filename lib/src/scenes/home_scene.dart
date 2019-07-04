import 'package:flutter/material.dart';
import 'package:room_provider/src/components/home/person_listview.dart';
import 'package:room_provider/src/components/home/fab.dart';

class HomeScene extends StatelessWidget {
  final _listViewController = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Flutter Demo Home Page"),
    ),
    body: PersonListView(
      listViewController: _listViewController,
    ),
    floatingActionButton: Fab(
      listViewController: _listViewController,
    ),
  );
}
