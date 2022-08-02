// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:gestionapp/src/models/categoriasmodel.dart';
import 'package:gestionapp/src/models/productomodel.dart';
import 'package:http/http.dart' as http;


class MockApi {
  
  final urlproductos = "http://10.0.2.2:3000/productos";
  final urlcategorias = "http://10.0.2.2:3000/categorias";
  

  Future<List> getProdcutos() async {
   
    try {

    final resp = await http.get(Uri.parse(urlproductos));
    final data = json.decode(resp.body);

    final solicitud=[];   
       data.forEach((soli) {
           final solitemp = ProductoModel.fromJson(soli);
           solicitud.add(solitemp);
    });

    return solicitud;
    } catch (e) {
      print(e);
      return ["error"];
    }
  }

  Future<List<String>> getCategorias() async {
   
    try {

    final resp = await http.get(Uri.parse(urlcategorias));
    final data = json.decode(resp.body);

    List<String> solicitud=[];   
       data.forEach((soli) {
           final solitemp = CategoriasModel.fromJson(soli);
           solicitud.add(solitemp.nombre);
    });

    return solicitud;
    } catch (e) {
      print(e);
      return ["error"];
    }
  }


  Future postProducto(ProductoModel producto) async {
   try {

       await http.post(Uri.parse(urlproductos),
       headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},
       body: productomodelToJson(producto));
       print("Post producto");

      

       } 
   
   catch (e) {
       print(e);
       }
  }

  Future deleteProducto(ProductoModel producto,id) async {
   try {
           final urldelete="$urlproductos/$id";
           await http.delete(Uri.parse(urldelete), body: productomodelToJson(producto));
           print("delete producto");
       } 
   
   catch (e) {
       print(e);
       return false;

       }
  }

  Future putProducto(ProductoModel producto,id) async {
   try {
           final urlput="$urlproductos/$id";
           await http.put(Uri.parse(urlput),
           headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},
           body: productomodelToJson(producto));
           print("put producto");
       } 
   
   catch (e) {
       print(e);
       return false;

       }
  }

}