import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'navigation/routes.dart';
import 'providers/database_provider.dart';

class App extends StatelessWidget {
  App() {
    final router = Router();
    AppRoutesHandler.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) => DatabaseProvider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red
      ),
    ),
  );
}
