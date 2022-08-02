
import 'dart:convert';

CategoriasModel categoriasmodelFromJson(String str) => CategoriasModel.fromJson(json.decode(str));

String categoriasmodelToJson(CategoriasModel data) => json.encode(data.toJson());

class CategoriasModel {
    CategoriasModel({
        required this.id,
        required this.nombre,
        required this.tipo,
       
       
    });
    int id;
    String nombre;
    String tipo;
  

    factory CategoriasModel.fromJson(Map<String, dynamic> json) => CategoriasModel(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
       

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
     
    };
}
