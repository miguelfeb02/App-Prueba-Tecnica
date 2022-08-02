import 'package:flutter/material.dart';
import 'package:gestionapp/src/controllers/controllerproductos.dart';
import 'package:gestionapp/src/services/mockapi.dart';


class Dialogos {

  final mock=MockApi();
  
  borrar(context,producto){
    return showDialog(
      context: context, 

      builder: (context) {
        return   AlertDialog(
            content: const SizedBox(
              height: 50,
              child: Center(
                child: Text("¿ Desea eliminar este producto ?")
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () async{
                 await mock.deleteProducto(producto, producto.id);
                 Controllerproductos.to.actualizar();
                 Navigator.pop(context);

                }, 
                child: const Text("Si")),
                ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("No"))
            ],
        );
      },
      );
  }
}