


import 'package:flutter_test/flutter_test.dart';
import 'package:gestionapp/src/services/mockapi.dart';

void main() {
  test('Obteniedo lista de productos', () async {
    final mock = await MockApi().getProdcutos();
    expect(mock, ["error"]);
  });
}

// no se realizan pruebas unitarias como tal , debido a que todos los metodos y clases
// llaman widgets a excepcion de la clase mockApi que utiliza dependencias de terceros como Http