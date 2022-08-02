import 'package:flutter/material.dart';
import 'package:gestionapp/src/controllers/controllerproductos.dart';
import 'package:gestionapp/src/services/mockapi.dart';
import 'package:gestionapp/src/widgets/item.dart';
import 'package:gestionapp/src/widgets/opciones.dart';
import 'package:gestionapp/src/widgets/showdialog.dart';

import 'package:get/get.dart';

class Productos extends StatefulWidget {
  const Productos({Key? key}) : super(key: key);

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {


// se llaman los metodos para crear widgets y conseguir datos del servidor

  final widgets=Widgets();
  final opciones=Opciones();
  final mock=MockApi();
  final dialogo=Dialogos();
  

  String busqueda = "";
  TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text("GestionApp"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                buscador(),
                botonadd()
              ],
            ),
            Expanded(
                child: productos(),
              
            ),
            
          ],
        ),
      ),
    );

    
  }

 // widget para buscar  por nombre de producto dentro de la lista de productos


 buscador(){
  return Expanded(       child: Container(         padding: const EdgeInsets.all(15),         height: Get.height * 0.1,                  child: TextField(           keyboardType: TextInputType.text,           controller: control,           onChanged: (value) {             setState(() {               busqueda = value;                            });           },           decoration: const InputDecoration(             suffixIcon: Icon(Icons.search),             hintText: "Buscar por producto",             contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),             border: OutlineInputBorder(),           ),         ),       ),     );
 }
 
 //widget para agregar nuevo prodcutos
  
 botonadd(){
  return  SizedBox(
            width: Get.width*0.2,
            child: IconButton(
              iconSize: 50,
              color: Colors.blue,
              icon: const Icon(Icons.add_box),
              onPressed: (){
                 Navigator.pushNamed(context,"productoadd");
              },

             ),
           );
 }


//widget para crear la lista de productos

 productos(){
  return GetBuilder<Controllerproductos>(
        init: Controllerproductos(),
        builder: (state) {
          if (state.productos!=["error"]) {
            List filtradoLista = [];

          for (var element in state.productos) {
            if (element.producto.toString().toLowerCase().startsWith(busqueda.toLowerCase())) {
              filtradoLista.add(element);
            }
          }

        List reversed=filtradoLista.reversed.toList();
        return reversed.isNotEmpty? ListView.builder(
          itemCount: reversed.length,
          itemBuilder: (context, index) {
            
            return Dismissible(
              key: UniqueKey(),

              confirmDismiss: (direction)async {
               
                if (direction == DismissDirection.endToStart) {
                  Navigator.pushNamed(context, "productoedit",arguments: reversed[index]);
                 
                }
                if (direction == DismissDirection.startToEnd) {
                  dialogo.borrar(context,reversed[index]);

                }
                
              },
              
              background: opciones.borrar(),
              secondaryBackground: opciones.editar(),
              child: widgets.item(reversed[index],context));
          },
          ):const Center(
            child: Text("No existen productos creados"),
          );
          }else{
            return const Center(
            child: Text("Servidor Desconectado"),
          );
          }
          
      },

      );
 }


   
  
}