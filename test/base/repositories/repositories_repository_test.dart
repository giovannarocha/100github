import 'package:ambar_teste/base/repositories/repositories_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = RepositoriesRepository();
  test("Carregamento de lista de repositórios", () async {
    final list = await repository.fetchRepositories();
    print(list);
    print(list[0].name);
    expect(list[1].name, "merb-core");
  });
}
