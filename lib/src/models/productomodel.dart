
import 'dart:convert';

ProductoModel productomodelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productomodelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
        required this.id,
        required this.codigo,
        required this.estado,
        required this.precio,
        required this.producto,
        required this.descripcion,
        required this.idCategoria,
       
    });
    int id;
    String codigo;
    bool estado;
    String precio;
    String producto;
    String descripcion;
    int idCategoria;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        codigo: json["codigo"],
        estado: json["estado"],
        precio: json["precio"],
        producto: json["producto"],
        descripcion: json["descripcion"],
        idCategoria: json["idCategoria"],

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "estado": estado,
        "precio": precio,
        "producto": producto,
        "descripcion": descripcion,
        "idCategoria": idCategoria,
       
    };
}
