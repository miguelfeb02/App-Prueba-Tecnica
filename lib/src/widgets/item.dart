import 'package:flutter/material.dart';
import 'package:gestionapp/src/models/productomodel.dart';
import 'package:gestionapp/src/widgets/infproducto.dart';
import 'package:get/get.dart';

class Widgets {

  final info=Info();

  Widget item(ProductoModel producto,context) {
    final size=Get.size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.fromLTRB(size.width*0.05, 10, size.width*0.05, 10),
      child:Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft:Radius.circular(10)),
                
            ),
            
            width: Get.width*0.15,
            height: Get.height*0.08,
            child: const Icon
            (Icons.fact_check,
            color: Colors.white,
            size: 40,
            ),
          ),
          Expanded(
            child: SizedBox(
              
              width: Get.width*0.5,
              height: Get.height*0.08,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                    children: [
                      TextSpan(
                        text: producto.producto,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                      
                    ]
                  )),
                  RichText(text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Descripcion : ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                      TextSpan(
                        text: producto.descripcion,

                        style: const TextStyle(
                          
                          overflow: TextOverflow.ellipsis ,
                          fontSize: 12,
                          color: Colors.black
                        )
                      )
                    ]
                  )),
                  RichText(text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Precio : ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                      TextSpan(
                        text: "\$ ${producto.precio}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black
                        )
                      ),
                      
                    ]
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            
            height: Get.height*0.08,
            width: Get.width*0.15,
            child: IconButton(
              color: Colors.blue,
              iconSize: 40,
              icon: const Icon(Icons.article_rounded),
              onPressed: (){
                info.infoproducto(context,producto);
              },
            ),

          ),
         
        ],
      )
    );
  }
}