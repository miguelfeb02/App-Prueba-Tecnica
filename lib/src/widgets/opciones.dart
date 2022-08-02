import 'package:flutter/material.dart';

class Opciones{
   Widget borrar(){
    
    return Row(
      children: const [
        SizedBox(width:50),
        Text("Borrar",style: TextStyle(color: Colors.red),),
        Icon(Icons.delete,color: Colors.red,)
      ],
    );
  }
  Widget editar(){
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        
        Text("Editar",style: TextStyle(color: Colors.green),),
        Icon(Icons.delete,color: Colors.green,),
        SizedBox(width:50),
      ],
    );
  }
}