

// ignore_for_file: must_call_super

import 'package:gestionapp/src/models/productomodel.dart';
import 'package:gestionapp/src/services/mockapi.dart';
import 'package:get/get.dart';


//Con el controllerform se controla el estado de los valores de cada en el formulario


class Controllerform extends GetxController {
  static Controllerform get to => Get.find();
  
  
  final pmodel=ProductoModel(
           codigo: '', 
           descripcion: '', 
           estado: false, 
           id: 0, 
           idCategoria: 0,
           precio: '',
           producto: '');
 
  var mock=MockApi();
  List productos=[];
  List<String> categorias=[]; 
  int mayor=0;
  

  @override
  void onInit() async {
    
    productos = await mock.getProdcutos();
    categorias = await mock.getCategorias();

    for (var i = 0; i < productos.length; i++) {
      if (productos[i].id > mayor) {
        mayor=productos[i].id;
      }
    }
    pmodel.id=mayor+1;
    
    update();
    
  }
  
  actualizarid(id) async {
      pmodel.id=id;
    update();
  }
  actualizarproducto(producto) async {
      pmodel.producto=producto.toString().toUpperCase();
    update();
  }
  actualizarcodigo(codigo) async {
      pmodel.codigo=codigo;
    update();
  }
  actualizardescripcion(descripcion) async {
      pmodel.descripcion=descripcion;
    update();
  }
  actualizarestado(estado) async {
      if (estado=="Inactivo") {
        pmodel.estado=false;
      }
      if (estado=="Activo") {
        pmodel.estado=true;
      }
    update();
  }
  actualizarprecio(precio) async {
      pmodel.precio=precio;
    update();
  }
  actualizarcategoria(categoria) async {
      switch (categoria) {
          case "Tipo A" : pmodel.idCategoria=0;
          break;
          case "Tipo B" : pmodel.idCategoria=1;
          break;
          case "Tipo C" : pmodel.idCategoria=2;
          break;
        default:
      }
    update();
  }


  
}