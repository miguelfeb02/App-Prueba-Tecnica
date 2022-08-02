
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Info {
  infoproducto( context ,data){

    String estado="";
    String categoria="";

    if (data.estado) {
      estado="Activo";
    }else{
      estado="Inactivo";
    }
     
    switch (data.idCategoria) {
        case 0: categoria="Tipo A";
        break;
        case 1: categoria="Tipo B";
        break;
        case 2: categoria="Tipo C";
        break;
      default:
    } 

    List titulos=[

     "Id",
     "Producto",
     "Codigo",
     "Estado",
     "Descripcion",
     "Precio",
     "Categoria"

     ];

     List listdata=[

     data.id,
     data.producto,
     data.codigo,
     estado,
     data.descripcion,
     data.precio,
     categoria

     ];


   return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: Get.height*0.18,
          width: Get.width*0.8,
          child: ListView.builder(
            
            itemCount: titulos.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text("${titulos[index]} : ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                  Flexible(
                    child: Text(listdata[index].toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    ),
                  )    
                ],
              );
            },),
        )
      );
    }); 
  }
}