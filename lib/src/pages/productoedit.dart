import 'package:flutter/material.dart';
import 'package:gestionapp/src/controllers/controllerform.dart';
import 'package:gestionapp/src/controllers/controllerproductos.dart';
import 'package:gestionapp/src/models/productomodel.dart';
import 'package:gestionapp/src/services/mockapi.dart';
import 'package:gestionapp/src/widgets/form.dart';
import 'package:get/get.dart';


class ProductoEdit extends StatefulWidget {
  const ProductoEdit({Key? key}) : super(key: key);

  @override
  State<ProductoEdit> createState() => _ProductoEditState();
}

class _ProductoEditState extends State<ProductoEdit> {

  final form = Formulario();
  final GlobalKey<FormState> keyforme = GlobalKey<FormState>();
  final estado=["Activo","Inactivo"];
  final mock=MockApi();

   

  
  @override
  Widget build(BuildContext context) {
    final productodata=ModalRoute.of(context)!.settings.arguments as ProductoModel;
    return Scaffold(
      appBar: AppBar(title:  Text("Editar Producto (ID=${productodata.id})"),),
      body: GetBuilder<Controllerform>(
        init: Controllerform(),
        builder: (state) {
          
          return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Get.height*0.05,
                      horizontal: Get.width*0.05),
                    child: Form(
                      key: keyforme,
                      child: SingleChildScrollView(
                        child: Column(
                          children:  [
                            
                            form.itemform("Nombre de Producto",1,"producto",true,false,productodata.producto),
                            const SizedBox(height: 15,),
                            form.itemform("Codigo",3,"codigo",true,true,productodata.codigo),
                            const SizedBox(height: 15,),
                            form.dropdownedit(["Activo","Inactivo"],"estado",productodata.estado),
                            const SizedBox(height: 15,),
                            form.itemform("Descripcion",3,"descripcion",true,true,productodata.descripcion),
                            const SizedBox(height: 15,),
                            form.itemform("Precio",4,"precio",true,false,productodata.precio),
                            const SizedBox(height: 30,),
                            form.dropdownedit(state.categorias,"categoria",productodata.idCategoria),
                            const SizedBox(height: 15,),
                            
                            btneditar(state.pmodel,productodata.id)
                          ],
                        ),
                      ),
                    ),
                  );
        }
      )
    );
  }

  btneditar(productomodel,id){
    return ElevatedButton(
      onPressed: () async{
        
        if (keyforme.currentState!.validate()) {
          keyforme.currentState!.save();
          await mock.putProducto(productomodel,id);
          Controllerproductos.to.actualizar();
          Navigator.pushNamed(context, "productos");
        }
          
      
       }, 
    child:const SizedBox(
      width: 100,
            child:  Center(child: Text("Editar"))
          ));
  }
}