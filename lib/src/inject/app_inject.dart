import 'package:flutter_simple_dependency_injection/injector.dart';
import '../persistence/database.dart';

class AppContainer {
  static Future<void> initialise() async {
    final injector = Injector.getInjector();
    injector.map((_) async => await $FloorAppDatabase.databaseBuilder("database").build());
  }
}