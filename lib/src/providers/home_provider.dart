import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';
import '../persistence/dao/person_dao.dart';

class HomeProvider extends StatelessWidget {
  HomeProvider({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Consumer<PersonDao>(
    builder: (_, personDao, ___) => MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          builder: (_) => HomeViewModel(personDao),
        ),
      ],
      child: child,
    ),
  );
}
