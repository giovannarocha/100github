import 'package:ambar_teste/base/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final controller = HomeController();

  test("Deve preencher variaveis", () async {
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.repositories.isNotEmpty, true);
  });
}
