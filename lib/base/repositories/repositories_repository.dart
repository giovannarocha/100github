import 'package:ambar_teste/base/models/repositories_model.dart';
import 'package:dio/dio.dart';

class RepositoriesRepository {
  final dio = Dio();
  final url = "https://api.github.com/repositories";

  Future<List<RepositoriesModel>> fetchRepositories() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<RepositoriesModel> repositories = [];
    for (var json in list) {
      final repository = RepositoriesModel.fromJson(json);
      repositories.add(repository);
    }
    return repositories;
  }
}
