import 'package:ambar_teste/base/models/repositories_model.dart';
import 'package:ambar_teste/base/repositories/repositories_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<RepositoriesModel> repositories = [];
  final repository = RepositoriesRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      repositories = await repository.fetchRepositories();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
