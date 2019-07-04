import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../persistence/database.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import '../persistence/dao/person_dao.dart';

class DatabaseProvider extends StatelessWidget {
  DatabaseProvider({this.child});

  final Widget child;
  final _injector = Injector.getInjector();
  AppDatabase get database => _injector.get<AppDatabase>();

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      Provider<PersonDao>(
        builder: (_) => database.personDao,
      ),
    ],
    child: child,
  );
}
