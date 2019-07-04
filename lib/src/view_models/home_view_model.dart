import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../persistence/entity/person.dart';
import '../persistence/dao/person_dao.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._personDao);

  final PersonDao _personDao;

  bool isLoading = false;
  Stream<List<Person>> get persons => _personDao.findAllPersonsAsStream();

  Future<void> addNewPerson(ScrollController scrollController) async {
    isLoading = true;
    notifyListeners();

    await _personDao.insertPerson(Person(null, 'Nome'));
    await Future.delayed(Duration(milliseconds: 100));
    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease
    );

    isLoading = false;
    notifyListeners();
  }

  Future<void> removePerson(Person person) => _personDao.removePerson(person);
}
