import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'src/app.dart';
import 'src/persistence/database.dart';


void main() async {
  final _injector = Injector.getInjector();
  final database = await $FloorAppDatabase
      .inMemoryDatabaseBuilder()
      .build();

  _injector.map<AppDatabase>((_) => database);

  runApp(App());
}