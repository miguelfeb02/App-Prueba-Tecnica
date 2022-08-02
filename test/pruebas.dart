


import 'package:flutter_test/flutter_test.dart';
import 'package:gestionapp/src/services/mockapi.dart';

void main() {
  test('Obteniedo lista de productos', () async {
    final mock = await MockApi().getProdcutos();
    expect(mock, ["error"]);
  });
}

// no se realizan pruebas unitarias como tal , debido a que todos