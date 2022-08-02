// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gestionapp/src/controllers/controllerform.dart';
import 'package:gestionapp/src/controllers/controllerproductos.dart';


import 'package:gestionapp/src/services/mockapi.dart';

import 'package:gestionapp/src/widgets/form.dart';
import 'package:get/get.dart';


class ProductoAdd extends StatefulWidget {
  const ProductoAdd({Key? key}) : super(key: key);

  @override
  State<ProductoAdd> createState() => _ProductoAddState();
}

class _ProductoAddState extends State<ProductoAdd> {

  final form = Formulario();
  final GlobalKey<FormState> keyform = GlobalKey<FormState>();
  final estado=["Activo","Inactivo"];
  final mock=MockApi();
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controllerform>(
      init: Controllerform(),
      builder: (state) {
        
        return Scaffold(
          appBar: AppBar(title: Text("Agregar Producto  (ID=${state.pmodel.id})"),),
          body:  Container(
                margin: EdgeInsets.symmetric(
                  vertical: Get.height*0.05,
                  horizontal: Get.width*0.05),
                child: Form(
                  key: keyform,
                  child: SingleChildScrollView(
                    child: Column(
                      children:  [
                        
                        form.itemform("Nombre de Producto",1,"producto",true,false,""),
                        const SizedBox(height: 15,),
                        form.itemform("Codigo",3,"codigo",true,true,""),
                        const SizedBox(height: 15,),
                        form.dropdown(["Activo","Inactivo"],"estado"),
                        const SizedBox(height: 15,),
                        form.itemform("Descripcion",3,"descripcion",true,true,""),
                        const SizedBox(height: 15,),
                        form.itemform("Precio",4,"precio",true,false,""),
                        const SizedBox(height: 30,),
                        form.dropdown(state.categorias,"categoria"),
                        const SizedBox(height: 15,),
                        
                        btnenviar(state.pmodel)
                      ],
                    ),
                  ),
                ),
              )
            
          
        );
      }
    );
  }

  btnenviar(productomodel){
    return ElevatedButton(
      onPressed: () async{
        
        if (keyform.currentState!.validate()) {
          keyform.currentState!.save();
          await mock.postProducto(productomodel);
          Controllerproductos.to.actualizar();
          Navigator.pushNamed(context, "productos");
        }
          
      
       }, 
    child:const SizedBox(
      width: 100,
            child:  Center(child: Text("Enviar"))
          ));
  }
}