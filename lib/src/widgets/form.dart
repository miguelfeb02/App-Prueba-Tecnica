
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionapp/src/controllers/controllerform.dart';


class Formulario {
  
  Widget itemform(nombre,numformato,save,lock,opcional,inicial){

     //se inicializan las variables para modificar el formato y tipo de teclado para cada campo

     FilteringTextInputFormatter formato=FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'));
     var kboard=TextInputType.text;  
    
    switch (numformato) {
      case 1: {
        formato=FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'));
        kboard=TextInputType.text;
      }
      break;
      case 2: {
        formato=formato=FilteringTextInputFormatter.allow(RegExp('[0-9]'));
        kboard=TextInputType.number;
      }
      break;
      case 3: {
        formato=FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
        kboard=TextInputType.text;
      }
      break;
      case 4: {
        formato=FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));
        kboard=const TextInputType.numberWithOptions(decimal: true);
      }
      break;
      
      
      default:
    }
    //se retorna el campo con las opciones configuradas

    return TextFormField(
      initialValue: inicial,
      enabled: lock,
      inputFormatters: [formato],
      maxLines: 1,
      keyboardType: kboard,
      decoration: InputDecoration(
      labelText: nombre,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10.0),
               borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
           ),
     validator: (value) {
        if (!opcional) {
            if (value!.isEmpty) {
                 return "Texto vacio";
            } else {
                 return null;
             }
             }
           },

           //se actualizan los valores de cada campo dentro del modelo utilizando
           //el gestor de estados

      onSaved: (value) async {

            switch (save) {
                case "producto": await Controllerform.to.actualizarproducto(value);
                break;
                case "codigo": await Controllerform.to.actualizarcodigo(value);
                break;
                case "descripcion": await Controllerform.to.actualizardescripcion(value);
                break;
                case "precio": await Controllerform.to.actualizarprecio(value);
                break;
              default:
            }
           }
     );
   }


   //Widget para crear los dropdownlist 
   
   Widget dropdown(List<String >lista,String nombre){
    return DropdownButtonFormField(
      onChanged: (value) {
        
      },
      onSaved: (value) {
        switch (nombre) {
            case "estado": Controllerform.to.actualizarestado(value);
            break;
            case "categoria": Controllerform.to.actualizarcategoria(value);
            break;
          default:
        }
      },
      validator: (value) {
             if (value==null || value=="") {
               return "Seleccione un item";
             } else {
               return null;
             }
           },
       items: lista.map((String val) {
             return DropdownMenuItem<String>(
               value: val,
               child: Text(val),
             );
           }).toList(),
      decoration: InputDecoration(
        labelText: nombre,
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
           enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue)
            )),
      );
   }
   
   dropdownedit(List<String >lista,String nombre,inicial){
    String valor="";
      if (nombre=="estado") {
        switch (inicial) {
            case false: valor="Inactivo";
            break;
            case true: valor="Activo";
            break;
          default:
        }
      }
      if (nombre=="categoria") {
        switch (inicial) {
            case 0: valor="Tipo A";
            break;
            case 1: valor="Tipo B";
            break;
            case 2: valor="Tipo C";
            break;
          default:
        }
      }
    return DropdownButtonFormField(
      onChanged: (value)=>{},
      value:valor ,
      onSaved: (value) {
        switch (nombre) {
                 case "estado": Controllerform.to.actualizarestado(value);
                break;
                case "categoria": Controllerform.to.actualizarcategoria(value);
                break;
          default:
        }
      },
      validator: (value) {
             if (value==null || value=="") {
               return "Seleccione un item";
             } else {
               return null;
             }
           },
       items: lista.map((String val) {
             return DropdownMenuItem<String>(
               value: val,
               child: Text(val),
             );
           }).toList(),
      decoration: InputDecoration(
        labelText: nombre,
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
           border: OutlineInputBorder(
               borderSide: const BorderSide(color: Colors.blue),
               borderRadius:BorderRadius.circular(10))),
      );
   }

}