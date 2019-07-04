import 'package:floor/floor.dart';
import 'package:room_provider/src/persistence/entity/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person')
  Stream<List<Person>> findAllPersonsAsStream();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person> findPersonById(int id);

  @update
  Future<int> updatePerson(Person person);

  @insert
  Future<void> insertPerson(Person person);

  @delete
  Future<void> removePerson(Person person);
}
