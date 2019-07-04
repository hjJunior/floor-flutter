import 'package:floor/floor.dart';

@entity
class Person {
  Person(this.id, this.name);

  @PrimaryKey(autoGenerate: true)
  final int id;
  String name;
}