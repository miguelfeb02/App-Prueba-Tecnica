

// ignore_for_file: must_call_super

import 'package:gestionapp/src/services/mockapi.dart';
import 'package:get/get.dart';



//Con el controllerproductos se controla el estado de la lista de productos

class Controllerproductos extends GetxController {
  static Controllerproductos get to => Get.find();
  
  var mock=MockApi();
 
  List productos=[]; 
  List categorias=[]; 



  @override
  void onInit() async {
    
    productos  = await mock.getProdcutos();
    update();
    
  }

  actualizar() async {
   
    productos= await mock.getProdcutos();
    update();
  }

 
  
  
}